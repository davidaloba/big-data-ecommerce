import api from '@globalStore/api'
import { getStrapiURL } from '@globalUtils/index'

const projectsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getProjects: build.query({
      query: ({ page, perPage, category }) => {
        const start = +page === 1 ? 0 : (+page - 1) * perPage
        const pagination = `&pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true`
        const categoryFilter = category ? `filters[kind][slug][$eq]=${category}` : ''
        const populate = `&populate=*`
        console.log(category)

        return getStrapiURL(`/projects?${categoryFilter}${pagination}${populate}`)
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
    })
  }),
  overrideExisting: false
})

export const { useGetProjectsQuery, useGetKindsQuery } = projectsApi
