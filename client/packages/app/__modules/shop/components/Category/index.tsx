// import { useState } from 'react'
import { useGetPageDataQuery } from '@globalStore/api'
import { getStrapiURL } from '@globalUtils/index'

import NoResults from '@marketingComponents/__lib/no-results'
import Repeatable from '@appComponents/__lib/Repeatable'
import ProductCard from '@appComponents/__lib/ProductCard'
import { useGetProductsQuery } from '@appModules/shop/store/api'

const Category = ({ slug }) => {
  // TODO: populate only required product fields {name, slug, featuredImages, price}
  const { data: products, isSuccess } = useGetProductsQuery(slug)

  // TODO: Add filter and sort functionality
  // const [openFilter, setOpenFilter] = useState(false)
  // const [openSort, setOpenSort] = useState(false)
  // const filteredProducts = products.filter((product) => {})

  return isSuccess ? (
    <section className=" py-0 px-6 md:px-8 lg:px-12 2xl:px-14 ">
      <div className="flex flex-row justify-between items-center ">
        <div
          className="flex flex-row min-w-56
             uppercase ">
          <h1 className="md:mr-3">{slug}</h1>
          <p>/</p>
          {products && (
            <h1 className="md:ml-3">{`${products.length} product${
              products.length > 1 ? 's' : ''
            }`}</h1>
          )}
        </div>
        {/*
        // TODO: Add filter and sort buttons
         <div className="flex flex-row justify-end">
          <div className="mr-6">
            <button
              type="button"
              className=""
              onClick={() => setOpenFilter(!openFilter)}>
              Filter
            </button>
          </div>
          <div>
            <button
              type="button"
              className=""
              onClick={() => setOpenSort(!openSort)}>
              Sort
            </button>
          </div>
        </div> */}
      </div>
      <Repeatable
        Element={ProductCard}
        elements={products}
        style={{
          container: `mt-6
          flex flex-col gap-4 
          md:grid md:grid-cols-4  md:gap-8`,
          wrapper: `md:col-span-1 md:col-span-1`
        }}
        pre="product"
      />
    </section>
  ) : (
    <NoResults
      status={isSuccess}
      length={5}
    />
  )
}

export default Category
