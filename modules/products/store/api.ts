import { api } from '../../../global/store'

const productsApi = api.injectEndpoints({
  endpoints: (build) => ({
    example: build.query({
      query: () => 'test'
    }),
    getProducts: build.query({
      query: (name) => `pokemon/${name}`
    })
  }),
  overrideExisting: false
})

export const { useExampleQuery, useGetProductsQuery } = productsApi
