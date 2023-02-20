import api from '@store/api'

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
      transformResponse: (responseData) => {
        return responseData.data
      }
    })
  }),
  overrideExisting: false
})

export const { useGetProductsQuery } = productsApi
