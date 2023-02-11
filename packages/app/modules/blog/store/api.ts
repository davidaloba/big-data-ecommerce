import api from '@store/api'
import { createEntityAdapter, createSelector } from '@reduxjs/toolkit'

const articlesAdapter = createEntityAdapter()
const initialState = articlesAdapter.getInitialState()

const articlesApi = api.injectEndpoints({
  endpoints: (build) => ({
    getArticles: build.query({
      query: (key) => {
        const categoryName = key.category
        const localeCode = key.locale
        const pageNumber = key.page
        const perPage = key.perPage
        const start = +pageNumber === 1 ? 0 : (+pageNumber - 1) * perPage

        let baseUrl = `/articles?pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=image,category,author,seo`
        if (categoryName) {
          baseUrl = `${baseUrl}&filters[category][name][$eq]=${categoryName}`
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

export const { useGetArticlesQuery } = articlesApi

// Calling `someEndpoint.select(someArg)` generates a new selector that will return
// the query result object for a query with those parameters.
// To generate a selector for a specific query argument, call `select(theQueryArg)`.
// In this case, the articles query has no params, so we don't pass anything to select()
export const selectArticlesResult = articlesApi.endpoints.getArticles.select()
const selectArticlesData = createSelector(
  selectArticlesResult,
  (articlesResult) => articlesResult.data
)
export const { selectAll: selectAllArticles, selectById: selectArticleById } =
  articlesAdapter.getSelectors(
    (state) => selectArticlesData(state) ?? initialState
  )

// transformResponse: all consumers of the endpoint want a specific format, such as normalizing the response to enable faster lookups by ID
