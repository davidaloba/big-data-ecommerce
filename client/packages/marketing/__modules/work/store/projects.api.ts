import api from '@globalStore/api'

const projectsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getProjects: build.query({
      query: () => `${process.env.API_URL}/api/projects?populate=deep`,
      transformResponse: (res: { [index: string]: object | object[] }) => {
        return res.data
      }
    })
  }),
  overrideExisting: false
})

export const { useGetProjectsQuery } = projectsApi
