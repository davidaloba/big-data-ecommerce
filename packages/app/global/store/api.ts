import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
// @ts-expect-error TS(6137): Cannot import type declaration files. Consider imp... Remove this comment to see the full error message
import type { Global, Page } from '@types/models'
import { HYDRATE } from 'next-redux-wrapper'

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
      query: (locale: string) =>
        `/global?populate[navigation][populate]=*&populate[footer][populate][footerColumns][populate]=*&locale=${locale}`,
      transformResponse: (res) => {
        // @ts-expect-error TS(2339): Property 'data' does not exist on type 'unknown'.
        const data: Global = res.data
        return data
      }
    }),
    getPageData: build.query({
      query: (url: string) => url,
      transformResponse: (res) => {
        // @ts-expect-error TS(2339): Property 'data' does not exist on type 'unknown'.
        const data = res.data
        const pageData: Page = Array.isArray(data) ? data[0] : data
        return pageData
      }
    }),
    getTags: build.query({
      query: () => `/tags?pagination[limit]=99`,
      transformResponse: (res) => {
        // @ts-expect-error TS(2339): Property 'data' does not exist on type 'unknown'.
        const data = res.data
        return data
      }
    }),
    getCategories: build.query({
      query: () => `/categories?pagination[limit]=99`,
      transformResponse: (res) => {
        // @ts-expect-error TS(2339): Property 'data' does not exist on type 'unknown'.
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
