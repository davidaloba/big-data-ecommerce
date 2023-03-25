import api from '@globalStore/api'

const productsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getProducts: build.query({
      query: (key) => {
        const categoryName = key.category
        const localeCode = key.locale
        const pageNumber = key.page
        const perPage = key.perPage
        const tagName = key.tag
        const start = +pageNumber === 1 ? 0 : (+pageNumber - 1) * perPage

        let baseUrl = `/products?pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=deep`
        if (categoryName) {
          baseUrl = `${baseUrl}&filters[category][name][$eq]=${categoryName}`
        }
        if (tagName) {
          baseUrl = `${baseUrl}&filters[tag][name][$eq]=${tagName}`
        }
        if (localeCode) {
          baseUrl = `${baseUrl}&locale=${localeCode}`
        }
        return baseUrl
      },
      transformResponse: (responseData: { [index: string]: object | object[] }) => {
        return responseData.data
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

export const { useGetProductsQuery, useGetCollectionQuery, useGetTagsQuery } = productsApi
