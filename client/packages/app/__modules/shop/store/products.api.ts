import api from '@globalStore/api'
import { getStrapiURL } from '@globalUtils/index'
import { IProduct } from '../__types'

const productsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getProduct: build.query({
      query: (url) => url,
      transformResponse: (product): IProduct => {
        return Array.isArray(product.data)
          ? product.data[0] && product.data[0].attributes
          : product.data && product.data.attributes
      }
    }),
    getProducts: build.query({
      query: (category) => {
        const pageNo = 1
        const start = +pageNo === 1 ? 0 : (+pageNo - 1) * 24
        const baseUrl = `/products?pagination[limit]=${24}&pagination[start]=${start}&pagination[withCount]=true`

        return getStrapiURL(
          category === 'shop'
            ? `${baseUrl}&populate=deep`
            : `${baseUrl}&filters[categories][slug][$eq]=${category}&populate=deep`
        )
      },
      transformResponse: (res): Array<IProduct> => {
        return res.data
      }
    }),
    getRelatedProducts: build.query({
      query: ({ category, slug }) =>
        getStrapiURL(
          `/products?filters[categories][slug][$eq]=${category}&filters[slug][$ne]=${slug}&pagination[limit]=${4}&populate=deep`
        ),
      transformResponse: (res): Array<IProduct> => {
        return res.data
      }
    })
  }),
  overrideExisting: false
})

export const { useGetProductsQuery, useGetRelatedProductsQuery, useGetProductQuery } = productsApi
