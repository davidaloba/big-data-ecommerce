import api from '@globalStore/api'

const productsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getProducts: build.query({
      query: (category) => {
        const pageNo = 1
        const start = +pageNo === 1 ? 0 : (+pageNo - 1) * 24
        const baseUrl = `/products?pagination[limit]=${24}&pagination[start]=${start}&pagination[withCount]=true`

        return category === 'shop'
          ? `${baseUrl}&populate=deep`
          : `${baseUrl}&filters[category][slug][$eq]=${category}&populate=deep`

        return baseUrl
      },
      transformResponse: (res: { [index: string]: object | object[] }) => {
        return res.data
      }
    }),
    getProduct: build.query({
      query: (url) => url,
      transformResponse: (res) => {
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
    getCollection: build.query({
      query: () => `/collections?pagination[limit]=99`,
      transformResponse: (res: { [index: string]: object | object[] }) => {
        const data = res.data
        return data
      }
    })
  }),
  overrideExisting: false
})

export const { useGetProductsQuery, useGetProductQuery, useGetTagsQuery } = productsApi
