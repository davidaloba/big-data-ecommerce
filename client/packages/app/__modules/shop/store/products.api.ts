import api from '@globalStore/api'
import { getStrapiURL } from '@globalUtils/index'

interface IProduct {
  slug?
  name?
  featuredImage?
  hoverImage?
  category?
  price?
  color?
  size?
  gallery?
  description?
}

const productsApi = api.injectEndpoints({
  endpoints: (build) => ({
    getProducts: build.query({
      query: (category) => getStrapiURL(category === 'shop'
          ? `${`/products?pagination[limit]=${24}&pagination[start]=${+1 === 1 ? 0 : (+1 - 1) * 24}&pagination[withCount]=true`}&populate=deep`
          : `${`/products?pagination[limit]=${24}&pagination[start]=${+1 === 1 ? 0 : (+1 - 1) * 24}&pagination[withCount]=true`}&filters[category][slug][$eq]=${category}&populate=deep`),
      transformResponse: (res): Array<IProduct> => {
        return res.data
      }
    }),
    getRelatedProducts: build.query({
      query: ({ category, slug }) => getStrapiURL(`/products?filters[category][slug][$eq]=${category}&filters[slug][$ne]=${slug}&pagination[limit]=${4}&populate=deep`),
      transformResponse: (res): Array<IProduct> => {
        return res.data
      }
    }),
    getProduct: build.query({
      query: (url) => url,
      transformResponse: (product): IProduct => {
        return Array.isArray(product.data)
          ? product.data[0] && product.data[0].attributes
          : product.data && product.data.attributes
      }
    })
  }),
  overrideExisting: false
})

export const { useGetProductsQuery, useGetRelatedProductsQuery, useGetProductQuery } = productsApi
