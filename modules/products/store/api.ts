import { createEntityAdapter, createSelector } from '@reduxjs/toolkit'

import api from '@store/api'

const usersAdapter = createEntityAdapter()
const initialState = usersAdapter.getInitialState()

const productsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getproducts: build.query({
      query: () => 'test',
      transformResponse: (responseData) => {
        return usersAdapter.setAll(initialState, responseData)
      },
      providesTags: (result = [], error, arg) => [
        'Product',
        ...result.map(({ id }) => ({ type: 'Product', id }))
      ]
    }),
    getProduct: build.query({
      query: (name) => `product/${name}`,
      providesTags: (result, error, arg) => [{ type: 'Product', id: arg }]
    }),
    addNewProduct: builder.mutation({
      query: (initialPost) => ({
        url: '/posts',
        method: 'POST',
        body: initialPost
      }),
      invalidatesTags: ['Post']
    }),
    editProduct: build.mutation({
      query: (initialProduct) => ({
        url: '/products',
        method: 'POST',
        body: initialProduct
      }),
      invalidatesTags: (result, error, arg) => [{ type: 'Product', id: arg.id }]
    })
  }),
  overrideExisting: false
})

export const { useGetProductsQuery, useGetProductQuery } = productsApi

// Calling `someEndpoint.select(someArg)` generates a new selector that will return
// the query result object for a query with those parameters.
// To generate a selector for a specific query argument, call `select(theQueryArg)`.
// In this case, the users query has no params, so we don't pass anything to select()
export const selectUsersResult = productsApi.endpoints.getproducts.select()
const selectUsersData = createSelector(
  selectUsersResult,
  (usersResult) => usersResult.data
)
export const { selectAll: selectAllUsers, selectById: selectUserById } =
  usersAdapter.getSelectors((state) => selectUsersData(state) ?? initialState)

// transformResponse: all consumers of the endpoint want a specific format, such as normalizing the response to enable faster lookups by ID
