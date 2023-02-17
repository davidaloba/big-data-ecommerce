import api from '@store/api'
import { createEntityAdapter, createSelector } from '@reduxjs/toolkit'

const usersAdapter = createEntityAdapter()
const initialState = usersAdapter.getInitialState()

const productsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getProducts: build.query({
      query: (key) => {
        const categoryName = key.category
        const localeCode = key.locale
        const pageNumber = key.page
        const perPage = key.perPage
        const tagName = key.tag
        const start = +pageNumber === 1 ? 0 : (+pageNumber - 1) * perPage

        let baseUrl = `/shop?pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=images,category,tag,information,seo`
        if (categoryName) {
          baseUrl = `${baseUrl}&filters[category][name][$eq]=${categoryName}`
        }
        if (tagName) {
          baseUrl = `${baseUrl}&filters[tag][name][$eq]=${tagName}`
        }
        if (localeCode) {
          baseUrl = `${baseUrl}&locale=${localeCode}`
        }
        return baseUrl
      },
      transformResponse: (responseData) => {
        return responseData.data
        // return usersAdapter.setAll(initialState, responseData.data)
      }
      // providesTags: (result = [], error, arg) => [
      //   'Product',
      //   ...result.map(({ id }) => ({ type: 'Product', id }))
      // ]
    })
  }),
  overrideExisting: false
})

export const { useGetProductsQuery } = productsApi

// Calling `someEndpoint.select(someArg)` generates a new selector that will return
// the query result object for a query with those parameters.
// To generate a selector for a specific query argument, call `select(theQueryArg)`.
// In this case, the users query has no params, so we don't pass anything to select()
export const selectProducts = productsApi.endpoints.getProducts.select()
const selectProductsData = createSelector(selectProducts, (productsResult) => productsResult.data)
export const { selectAll: selectAllProducts, selectById: selectProductsById } =
  usersAdapter.getSelectors((state) => selectProductsData(state) ?? initialState)

// transformResponse: all consumers of the endpoint want a specific format, such as normalizing the response to enable faster lookups by ID
