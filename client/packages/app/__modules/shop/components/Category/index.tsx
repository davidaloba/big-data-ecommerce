// import { useState } from 'react'

import NoResults from '@marketingComponents/__lib/no-results'
import Repeatable from '@marketingComponents/__lib/Repeatable'
import ProductCard from '@appModules/shop/components/ProductCard'
import { useGetProductsQuery } from '@appModules/shop/store/api'
import { getStrapiMedia } from '@globalUtils/index'
import Image from 'next/image'
import Link from 'next/link'

const Category = ({ name, parent, pageID, featuredImage, primaryButton, secondaryButton }) => {
  // TODO: populate only required product fields {name, slug, featuredImages, price}
  const { data: products, isSuccess } = useGetProductsQuery(pageID)

  // TODO: Add filter and sort functionality
  // const [openFilter, setOpenFilter] = useState(false)
  // const [openSort, setOpenSort] = useState(false)
  // const filteredProducts = products.filter((product) => {})

  return isSuccess ? (
    <section className=" pb-20 pt-0 px-8 md:px-12 lg:px-16 2xl:px-20 ">
      <div className="flex flex-row justify-between items-center ">
        <div
          className="flex flex-row min-w-56
             uppercase ">
          {parent.data && (
            <>
              <h1 className="md:mr-3">{parent.data.attributes.name}</h1>
              <p className="md:mr-3">/</p>
            </>
          )}

          <h1 className="md:mr-3">{name}</h1>
          <p className="md:mr-3">/</p>
          {products && <h1>{`${products.length} product${products.length !== 1 ? 's' : ''}`}</h1>}
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
      {featuredImage.data && (
        <div className="relative mt-6">
          <Image
            src={getStrapiMedia(featuredImage.data.attributes.url)}
            alt={`${name} featured Image`}
            width="1366"
            height="800"
          />
          <div
            className="absolute top-[47%] left-[33%] min-w-[34%]  z-10 
            flex flex-row  gap-3 justify-center 
            uppercase ">
            {primaryButton && (
              <Link
                className=" w-full"
                href={primaryButton.href}>
                <button
                  className="w-full bg-white font-semibold text-gray-600"
                  type="button">
                  {primaryButton.label}
                </button>
              </Link>
            )}
            {secondaryButton && (
              <Link
                className=" w-full"
                href={secondaryButton.href}>
                <button
                  className="w-full bg-white font-semibold text-gray-600"
                  type="button">
                  {secondaryButton.label}
                </button>
              </Link>
            )}
          </div>
        </div>
      )}
      <Repeatable
        Element={ProductCard}
        elements={products}
        style={{
          container: `mt-16
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
