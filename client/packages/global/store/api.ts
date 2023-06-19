import { getStrapiURL } from '@globalUtils/index'
import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
import { HYDRATE } from 'next-redux-wrapper'
import { Global, Page } from 'packages/global/__types/models'

const api = createApi({
  reducerPath: 'api',
  baseQuery: fetchBaseQuery({
    baseUrl: `https://cms.yinkasamuels.com/api`
  }),
  extractRehydrationInfo(action, { reducerPath }) {
    if (action.type === HYDRATE) {
      return action.payload[reducerPath]
    }
  },
  tagTypes: [],
  endpoints: (build) => ({
    getGlobal: build.query({
      query: () => getStrapiURL(`/global?populate=deep`),
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
