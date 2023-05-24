import api from '@globalStore/api'
import { getStrapiURL } from '@globalUtils/index'

const projectsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getProjects: build.query({
      query: () => getStrapiURL(`/projects?populate=deep`),
      transformResponse: (res: { [index: string]: object | object[] }) => {
        return res.data
      }
    })
  }),
  overrideExisting: false
})

export const { useGetProjectsQuery } = projectsApi
