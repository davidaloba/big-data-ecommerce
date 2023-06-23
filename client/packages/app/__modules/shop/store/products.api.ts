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
      query: ({ pageID: category, sortBy, filterByColor, filterBySize, perPage }) => {
        const page = 1
        const start = +page === 1 ? 0 : (+page - 1) * perPage
        const pagination = `&pagination[limit]=${
          perPage || 24
        }&pagination[start]=${start}&pagination[withCount]=true`
        const populate = `&populate=*`

        const pageID = category === 'shop' ? `` : `filters[categories][slug][$eq]=${category}`
        const colorFilter = !filterByColor
          ? ``
          : filterByColor.map((color) => `&filters[color][label][$in]=${color}`).join('')
        const sizeFilter = !filterBySize
          ? ``
          : filterBySize.map((size) => `&filters[size][$contains]=${size}`).join('')
        const sort =
          sortBy === 'newest'
            ? ''
            : `&sort=price${sortBy === 'price (low to high)' ? '%3Aasc' : '%3Adesc'}`
        return getStrapiURL(
          `/products?${pageID}${colorFilter}${sizeFilter}${sort}${pagination}${populate}`
        )
      },
      transformResponse: (res): Array<IProduct> => {
        return res.data
      }
    }),
    getRelatedProducts: build.query({
      query: ({ category, slug }) =>
        getStrapiURL(
          `/products?filters[categories][slug][$eq]=${category}&filters[slug][$ne]=${slug}&pagination[limit]=${4}&populate=*`
        ),
      transformResponse: (res): Array<IProduct> => {
        return res.data
      }
    })
  }),
  overrideExisting: false
})

export const { useGetProductsQuery, useGetRelatedProductsQuery, useGetProductQuery } = productsApi
