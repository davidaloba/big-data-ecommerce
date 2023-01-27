import { api } from '../../../global/store'

const usersApi = api.injectEndpoints({
  endpoints: (build) => ({
    example: build.query({
      query: () => 'test'
    }),
    getUsers: build.query({
      query: (name) => `pokemon/${name}`
    })
  }),
  overrideExisting: false
})

export const { useExampleQuery, useGetUsersQuery } = usersApi
