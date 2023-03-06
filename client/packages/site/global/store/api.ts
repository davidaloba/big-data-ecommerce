import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
import { HYDRATE } from 'next-redux-wrapper'
import { Global, Page } from '@siteTypes/models'

const api = createApi({
  reducerPath: 'api',
  baseQuery: fetchBaseQuery({
    baseUrl: `${process.env.NEXT_PUBLIC_API_URL || 'http://localhost:1337'}/api`
  }),
  extractRehydrationInfo(action, { reducerPath }) {
    if (action.type === HYDRATE) {
      return action.payload[reducerPath]
    }
  },
  tagTypes: [],
  endpoints: (build) => ({
    getGlobal: build.query({
      query: () =>
        `/global?populate[navigation][populate]=*&populate[footer][populate][footerColumns][populate]=*`,
      transformResponse: (res: { data: Global; [index: string]: object | object[] }) => {
        return res
      }
    }),
    getPageData: build.query({
      query: (url: string) => url,
      transformResponse: (res: { data: Page | Page[]; [index: string]: object | object[] }) => {
        return res
      }
    }),
    getTags: build.query({
      query: () => `/tags?pagination[limit]=99`,
      transformResponse: (res: { [index: string]: object | object[] }) => {
        const data = res.data
        return data
      }
    }),
    getCategories: build.query({
      query: () => `/categories?pagination[limit]=99`,
      transformResponse: (res: { [index: string]: object | object[] }) => {
        const data = res.data
        return data
      }
    })
  })
})
export default api

export const {
  useGetGlobalQuery,
  useGetPageDataQuery,
  useGetCategoriesQuery,
  useGetTagsQuery,
  util: { getRunningQueriesThunk }
} = api

export const { getGlobal, getPageData } = api.endpoints
