import api from '@globalStore/api'

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
      query: (category) => {
        const pageNo = 1
        const start = +pageNo === 1 ? 0 : (+pageNo - 1) * 24
        const baseUrl = `/products?pagination[limit]=${24}&pagination[start]=${start}&pagination[withCount]=true`

        return category === 'shop'
          ? `${baseUrl}&populate=deep`
          : `${baseUrl}&filters[category][slug][$eq]=${category}&populate=deep`

        return baseUrl
      },
      transformResponse: (res): Array<IProduct> => {
        return res.data
      }
    }),
    getRelatedProducts: build.query({
      query: ({ category, slug }) => {
        const baseUrl = ``

        return `/products?filters[category][slug][$eq]=${category}&filters[slug][$ne]=${slug}&pagination[limit]=${4}&populate=deep`

        return baseUrl
      },
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
