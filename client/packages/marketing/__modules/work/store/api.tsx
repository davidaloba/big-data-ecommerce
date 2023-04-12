import api from '@globalStore/api'

const projectsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getProjects: build.query({
      query: () => `http://localhost:1337/api/projects?populate=deep`,
      transformResponse: (res: { [index: string]: object | object[] }) => {
        return res.data
      }
    })
  }),
  overrideExisting: false
})

export const { useGetProjectsQuery } = projectsApi
