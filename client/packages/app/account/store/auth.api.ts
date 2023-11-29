import api from '@app/_global/store/api'
import { getStrapiURL } from '@app/_global/utils/index'

export const authApi = api.injectEndpoints({
  endpoints: (build) => ({
    getUser: build.query({
      query: () => getStrapiURL('/users/me'),
      providesTags: ['User'],
      transformResponse: (res) => {
        return res
      }
    }),
    login: build.mutation({
      query: (data) => ({
        url: getStrapiURL('/auth/local'),
        method: 'POST',
        body: { identifier: data.email, password: data.password }
      }),
      transformResponse: (res) => {
        return res
      }
    }),
    register: build.mutation({
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
    changePassword: build.mutation({
      query: (data) => ({
        url: getStrapiURL(`/auth/change-password`),
        method: 'POST',
        body: data
      }),
      transformResponse: (res) => {
        return res.user
      }
    }),
    updateUser: build.mutation({
      query: (data) => ({
        url: getStrapiURL(`/users/me`),
        method: 'POST',
        body: data
      }),
      invalidatesTags: ['User'],

      transformResponse: (res) => {
        return res
      }
    })
  }),
  overrideExisting: false
})

export const {
  useRegisterMutation,
  useLoginMutation,
  useUpdateUserMutation,
  useChangePasswordMutation,
  useGetUserQuery
} = authApi

const enhancedApi = api.enhanceEndpoints({ addTagTypes: ['User'] })
