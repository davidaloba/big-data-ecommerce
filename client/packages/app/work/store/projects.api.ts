import api from '@app/_global/store/api'
import { getStrapiURL } from '@app/_global/utils/index'

const projectsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getProjects: build.query({
      query: ({ page, perPage, category }) => {
        const start = +page === 1 ? 0 : (+page - 1) * perPage
        const pagination = `&pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true`
        const categoryFilter = category ? `&filters[kind][slug][$eq]=${category}` : ''
        const sort = `&sort=publishedAt%3Adesc`
        const populate = `&populate=*`

        return getStrapiURL(`/projects?${categoryFilter}${sort}${pagination}${populate}`)
      },
      transformResponse: (res: { [index: string]: object | object[] }) => {
        return res.data
      }
    }),
    getKinds: build.query({
      query: () => getStrapiURL(`/kinds?populate=deep`),
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
        console.log(currentIndex, articles.length, next, prev)

        return { next, prev }
      }
    })
  }),
  overrideExisting: false
})

export const { useGetProjectsQuery, useGetKindsQuery, useGetNavigationQuery } = projectsApi
