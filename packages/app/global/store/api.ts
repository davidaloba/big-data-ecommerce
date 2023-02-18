import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
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
      query: (locale) =>
        `/global?populate[navigation][populate]=*&populate[footer][populate][footerColumns][populate]=*&locale=${locale}`,
      transformResponse: (responseData) => {
        return responseData.data
      }
    }),
    getPageData: build.query({
      query: (url) => url,
      transformResponse: (responseData) => {
        return responseData.data[0] || responseData.data
      }
    }),
    getTags: build.query({
      query: () => `/tags?pagination[limit]=99`,
      transformResponse: (responseData) => {
        return responseData.data
      }
    }),
    getCategories: build.query({
      query: () => `/categories?pagination[limit]=99`,
      transformResponse: (responseData) => {
        return responseData.data
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
