import api from '@siteStore/api'

const articlesApi = api.injectEndpoints({
  endpoints: (build) => ({
    getArticles: build.query({
      query: (key) => {
        const categoryName = key.category
        const pageNumber = key.page
        const perPage = key.perPage
        const start = +pageNumber === 1 ? 0 : (+pageNumber - 1) * perPage

        const baseUrl = `/articles?${
          categoryName && `filters[category][name][$eq]=${categoryName}&`
        }pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=deep`

        console.log(baseUrl)
        return baseUrl
      },
      transformResponse: (responseData: { [index: string]: object | object[] }) => {
        return responseData.data
      }
    })
  }),
  overrideExisting: false
})

export const { useGetArticlesQuery } = articlesApi
