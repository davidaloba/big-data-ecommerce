import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
import { HYDRATE } from 'next-redux-wrapper'
import { Global, Page } from 'packages/global/__types/models'
import { createSelector } from '@reduxjs/toolkit'

const api = createApi({
  reducerPath: 'api',
  baseQuery: fetchBaseQuery({
    baseUrl: `${process.env.NEXT_PUBLIC_API_URL}/api`
  }),
  extractRehydrationInfo(action, { reducerPath }) {
    if (action.type === HYDRATE) {
      return action.payload[reducerPath]
    }
  },
  tagTypes: [],
  endpoints: (build) => ({
    getGlobal: build.query({
      query: () => `/global?populate=deep`,
      transformResponse: (global: { data: Global; [index: string]: object | object[] }) => {
        return global.data.attributes
      }
    }),
    getPageData: build.query({
      query: (url: string) => url,
      transformResponse: (page: { data: Page | Page[]; [index: string]: object | object[] }) => {
        return Array.isArray(page.data) ? page.data[0].attributes : page.data.attributes
      }
    })
  })
})
export default api

export const {
  useGetGlobalQuery,
  useGetPageDataQuery,
  util: { getRunningQueriesThunk }
} = api

export const { getGlobal, getPageData } = api.endpoints

// Calling `someEndpoint.select(someArg)` generates a new selector that will return
// the query result object for a query with those parameters.
// To generate a selector for a specific query argument, call `select(theQueryArg)`.
// In this case, the users query has no params, so we don't pass anything to select()
export const selectPageData = api.endpoints.getPageData.select()

const emptyPageData = []

export const selectAllUsers = createSelector(
  selectPageData,
  (pageData) => pageData?.data ?? emptyPageData
)

// export const selectUserById = createSelector(
//   selectAllUsers,
//   (state, userId) => userId,
//   (users, userId) => users.find(user => user.id === userId)
// )
