import api from '@globalStore/api'
import { getStrapiURL } from '@globalUtils/index'

const articlesApi = api.injectEndpoints({
  endpoints: (build) => ({
    getArticles: build.query({
      query: (key) => {
        const contentType = key.contentType
        const pageNumber = key.page
        const perPage = key.perPage || 24
        const start = +pageNumber === 1 ? 0 : (+pageNumber - 1) * perPage
        const slug = key.slug
        const topicFilter = `filters[topic][slug][$eq]=${slug}&`
        const authorFilter = `filters[author][slug][$eq]=${slug}&`

        return getStrapiURL(
          contentType === 'topics'
            ? `/articles?${topicFilter}pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=deep`
            : contentType === 'authors'
            ? `/articles?${authorFilter}pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=deep`
            : contentType === 'recent'
            ? `/articles?pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&sort=publishedAt%3Aasc&populate=deep`
            : `/articles?pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=deep`
        )
      },
      transformResponse: (res: { [index: string]: object | object[] }) => {
        return res.data
      }
    }),

    getTopics: build.query({
      query: () => getStrapiURL(`/topics?populate=deep`),
      transformResponse: (res: { [index: string]: object | object[] }) => {
        return res.data
      }
    })
  }),
  overrideExisting: false
})

export const { useGetArticlesQuery, useGetTopicsQuery } = articlesApi
