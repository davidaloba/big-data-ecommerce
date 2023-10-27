import api from '@app/_global/store/api'
import { getStrapiURL } from '@app/_global/utils/index'

const articlesApi = api.injectEndpoints({
  endpoints: (build) => ({
    getArticle: build.query({
      query: (id) => {
        const sort = `&sort=publishedAt%3Adesc`
        return getStrapiURL(`/article/?${id}?${sort}`)
      },
      transformResponse: (article) => {
        return article?.data?.attributes
      }
    }),
    getArticles: build.query({
      query: ({ slug, page, perPage, author, topic }) => {
        const start = (+page === 1 ? 0 : (+page - 1) * perPage) || 0
        const pagination = `&pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true`
        const pageID = slug !== 'blog' ? `&filters[topics][slug][$in]=${slug}` : ''
        const topicFilter = topic ? `&filters[topics][slug][$in]=${topic}` : ''
        const authorFilter = author ? `&filters[author][slug][$eq]=${author}` : ''
        const sort = `&sort=publishedAt%3Adesc`
        const populate = `&populate=*`

        return getStrapiURL(
          `/articles?${pageID}${topicFilter}${authorFilter}${sort}${pagination}${populate}`
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
    }),
    getNavigation: build.query({
      query: (slug) => {
        const pagination = `&pagination[withCount]=true`
        const sort = `&sort=publishedAt%3Adesc`
        const populate = `&populate=[0]`

        return getStrapiURL(`/articles?${sort}${pagination}${populate}`)
      },
      transformResponse: (res, meta, arg) => {
        const articles = res.data
        const currentIndex = articles.findIndex((x) => x?.attributes?.slug === arg)
        const prev =
          currentIndex === articles.length - 1 ? '' : articles[currentIndex + 1].attributes?.slug
        const next = currentIndex === 0 ? '' : articles[currentIndex - 1].attributes?.slug
        return { next, prev }
      }
    })
  }),
  overrideExisting: false
})

export const {
  useGetArticleQuery,
  useGetArticlesQuery,
  useGetTopicsQuery,
  useGetAuthorsQuery,
  useGetNavigationQuery
} = articlesApi
