import api from '@globalStore/api'
import { getStrapiURL } from '@globalUtils/index'

const articlesApi = api.injectEndpoints({
  endpoints: (build) => ({
    getArticles: build.query({
      query: ({ slug, page, perPage, author, topic }) => {
        const start = +page === 1 ? 0 : (+page - 1) * perPage
        const pagination = `&pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true`
        const pageID = slug !== 'blog' ? `filters[topics][slug][$in]=${slug}` : ''
        const topicFilter = topic ? `filters[topics][slug][$in]=${topic}` : ''
        const authorFilter = author ? `filters[author][slug][$eq]=${author}` : ''
        const populate = `&populate=*`

        return getStrapiURL(
          `/articles?${pageID}${topicFilter}${authorFilter}${pagination}${populate}`
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
    }),

    getAuthors: build.query({
      query: () => getStrapiURL(`/authors?populate=deep`),
      transformResponse: (res: { [index: string]: object | object[] }) => {
        return res.data
      }
    })
  }),
  overrideExisting: false
})

export const { useGetArticlesQuery, useGetTopicsQuery, useGetAuthorsQuery } = articlesApi
