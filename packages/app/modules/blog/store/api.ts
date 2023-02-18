import api from '@store/api'

const articlesApi = api.injectEndpoints({
  endpoints: (build) => ({
    getArticles: build.query({
      query: (key) => {
        const categoryName = key.category
        const localeCode = key.locale
        const pageNumber = key.page
        const perPage = key.perPage
        const start = +pageNumber === 1 ? 0 : (+pageNumber - 1) * perPage

        let baseUrl = `/articles?pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=image,category,author,seo`
        if (categoryName) {
          baseUrl = `${baseUrl}&filters[category][name][$eq]=${categoryName}`
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

export const { useGetArticlesQuery } = articlesApi
