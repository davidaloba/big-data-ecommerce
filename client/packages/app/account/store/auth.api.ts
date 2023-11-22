import api from '@app/_global/store/api'
import { getStrapiURL } from '@app/_global/utils/index'

export const authApi = api.injectEndpoints({
  endpoints: (build) => ({
    createUser: build.mutation({
      query: (data) => ({
        url: getStrapiURL('/auth/local/register'),
        method: 'POST',
        body: {
          username: data.email,
          email: data.email,
          firstName: data.firstName,
          gender: data.gender[0],
          password: data.password,
          newsletter: data.newsletter
        }
      }),
      transformResponse: (res) => {
        return res
      }
    }),
    loginUser: build.mutation({
      query: (data) => ({
        url: getStrapiURL('/auth/local'),
        method: 'POST',
        body: { identifier: data.email, password: data.password }
      }),
      transformResponse: (res) => {
        return res
      }
    })
  }),
  overrideExisting: false
})

export const { useCreateUserMutation, useLoginUserMutation } = authApi
