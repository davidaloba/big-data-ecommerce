import { createApi, fetchBaseQuery } from '@reduxjs/toolkit/query/react'
import { apiHost, getStrapiURL } from '@app/_global/utils/index'
import { Global, Page } from '@app/_global/__types/models'
import { RootState } from '.'

const api = createApi({
  reducerPath: 'api',
  baseQuery: fetchBaseQuery({
    baseUrl: `${apiHost}/api`,
    prepareHeaders: (headers, { getState }) => {
      const token = (getState() as RootState).account.userToken
      if (token) {
        headers.set('authorization', `Bearer ${token}`)
        return headers
      }
    }
  }),
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
