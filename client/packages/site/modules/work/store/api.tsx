import api from '@siteStore/api'

const projectsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getProjects: build.query({
      query: (key) => {
        const categoryName = key.category
        const pageNumber = key.page
        const perPage = key.perPage
        const start = +pageNumber === 1 ? 0 : (+pageNumber - 1) * perPage

        const category = categoryName ? `filters[category][name][$eq]=${categoryName}&` : ''
        const baseUrl = `/projects?${category}pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=deep`

        return baseUrl
      },
      transformResponse: (res: { [index: string]: object | object[] }) => {
        return res.data
      }
    })
  }),
  overrideExisting: false
})

export const { useGetProjectsQuery } = projectsApi
