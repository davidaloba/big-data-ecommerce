'use client'
import { useState } from 'react'
import Image from 'next/image'
import Link from 'next/link'
import NoResults from '@app/_global/components/__lib/no-results'
import Repeatable from '@app/_global/components/__lib/Repeatable'
import { getStrapiMedia } from '@app/_global/utils/index'
import ProductCard from '../../components/ProductCard'
import { useGetProductsQuery } from '../../store/products.api'
import Filter from '../filter'
import Sort from '../sort'

const Category = ({
  name,
  parent,
  slug,
  featuredImage,
  primaryButton,
  secondaryButton,
  perPage
}) => {
  const { colors } = useGetProductsQuery(
    { slug },
    {
      selectFromResult: ({ data }) => ({
        colors: data?.reduce((a, c) => {
          return a.concat(
            c.attributes.color.reduce((a, c) => {
              return a.concat(c.label)
            }, [])
          )
        }, [])
      })
    }
  )
  const { sizes } = useGetProductsQuery(
    { slug },
    {
      selectFromResult: ({ data }) => ({
        sizes: data?.reduce((a, c) => {
          return a.concat(c.attributes.size)
        }, [])
      })
    }
  )
  const [openFilter, setOpenFilter] = useState(false)
  const [openSort, setOpenSort] = useState(false)
  const [filterByColor, setFilterByColor] = useState<string[]>([])
  const [filterBySize, setFilterBySize] = useState<string[]>([])
  const [sortBy, setSortBy] = useState('')
  const {
    data: products,
    isSuccess,
    refetch
  } = useGetProductsQuery({ slug, filterByColor, filterBySize, sortBy, perPage })

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
        <div className="flex flex-row gap-6 justify-end">
          <div className=" relative group ">
            <Filter
              setOpenSort={setOpenSort}
              openFilter={openFilter}
              setOpenFilter={setOpenFilter}
              colors={[...new Set(colors)]}
              sizes={[...new Set(sizes)]}
              filterByColor={filterByColor}
              filterBySize={filterBySize}
              setFilterByColor={setFilterByColor}
              setFilterBySize={setFilterBySize}
              refetch={refetch}
            />
          </div>
          <div className=" z-10 relative group ">
            <Sort
              setOpenFilter={setOpenFilter}
              openSort={openSort}
              setOpenSort={setOpenSort}
              sortBy={sortBy}
              setSortBy={setSortBy}
              refetch={refetch}
            />
          </div>
        </div>
      </div>
      {featuredImage.data && (
        <div className="relative mt-6">
          <Image
            src={getStrapiMedia(featuredImage.data.attributes.url)}
            alt={name + ' featured Image'}
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
