// import { useState } from 'react'
import { useGetProductQuery } from '../../store/api'
import { getStrapiURL } from '@globalUtils/index'

import NoResults from '@marketingComponents/__lib/no-results'
import ProductInfo from './product-details'

const Product = ({ slug }) => {
  const apiUrl = getStrapiURL(`/products/?filters[slug][$eq]=${slug}&populate=deep`)
  const { data, isSuccess } = useGetProductQuery(apiUrl)

  let product = {}
  if (isSuccess) {
    product = Array.isArray(data.data)
      ? data.data[0] && data.data[0].attributes
      : data.data && data.data.attributes
  }

  return isSuccess ? (
    <ProductInfo {...product} />
  ) : (
    <NoResults
      status={isSuccess}
      length={5}
    />
  )
}

export default Product
