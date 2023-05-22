import { useState } from 'react'
import { useGetProductQuery, useGetRelatedProductsQuery } from '../../store/products.api'
import { getStrapiURL, getStrapiMedia, numberWithCommas } from '@globalUtils/index'
import { useAppDispatch } from '@globalStore/index'
import { addToCart, openCart } from '@appModules/shop/store/cart.slice'
import Image from 'next/image'
import Link from 'next/link'
import ProductCard from '@appModules/shop/components/ProductCard'
import Repeatable from '@marketingComponents/__lib/Repeatable'

const Product = ({ pageID }) => {
  const apiUrl = getStrapiURL(`/products/?filters[slug][$eq]=${pageID}&populate=deep`)
  const { data: product, isSuccess } = useGetProductQuery(apiUrl)
  const {
    slug = '',
    name = '',
    featuredImage = null,
    hoverImage = null,
    price = null,
    color = null,
    size = null,
    category = null,
    gallery = null,
    description = null
  } = isSuccess ? product : {}

  const [selectedSize, setSelectedSize] = useState('')
  const [sizeError, setSizeError] = useState('')
  const createMarkup = () => {
    return { __html: description }
  }

  const dispatch = useAppDispatch()
  const cartHandler = () => {
    if (!selectedSize) {
      setSizeError('Please select a size')
      return
    }

    dispatch(
      addToCart({
        name,
        slug,
        featuredImage: featuredImage?.data?.attributes?.url,
        selectedSize,
        price
      })
    )

    setSizeError('')
    dispatch(openCart(true))
    setTimeout(() => dispatch(openCart(false)), 1000)
  }

  const { data: relatedProducts, isSuccess: relatedIsSuccess } = useGetRelatedProductsQuery({
    category: category?.data?.attributes?.slug,
    slug
  })

  return (
    <section className="pb-20 pt-0 px-8 md:px-12 lg:px-16 2xl:px-20">
      {isSuccess && (
        <div className="flex flex-col lg:flex-row">
          <div className="lg:w-[65vw] lg:-ml-24 group">
            <div className="bg-gray-100">
              {featuredImage && (
                <Image
                  className="group-hover:hidden"
                  src={getStrapiMedia(featuredImage.data.attributes.url)}
                  alt="logo"
                  width="1366"
                  height="20"
                />
              )}
              {hoverImage && (
                <Image
                  className="hidden group-hover:block"
                  src={getStrapiMedia(hoverImage.data.attributes.url)}
                  alt="logo"
                  width="1366"
                  height="20"
                />
              )}
            </div>
          </div>
          <div className="flex flex-col lg:w-[40%] lg:ml-[44px] uppercase">
            <div className="flex flex-row min-w-56 uppercase">
              <Link
                className="md:mr-3"
                href="/shop">
                SHOP
              </Link>
              {category?.data && (
                <>
                  <p>/</p>
                  <Link
                    className="md:ml-3"
                    href={`/category/${category.data.attributes.slug}`}>
                    {category.data.attributes.name}
                  </Link>
                </>
              )}
            </div>
            <p className="mt-20 lg:mt-7 text-base">{name}</p>
            <p className="mt-7">PRICE: {price && `$${numberWithCommas(price)}`}</p>
            <div className="flex flex-row mt-6 items-center">
              <p className="mr-3">COLOR:</p>
              {color && (
                <Repeatable
                  Element={({ label, slug, swatch }) => (
                    <Link href={`shop/${slug}`}>
                      <Image
                        src={getStrapiMedia(swatch.data.attributes.url)}
                        alt={`${label}`}
                        height="24"
                        width="24"
                      />
                    </Link>
                  )}
                  elements={color}
                  pre="color"
                  style={{ container: `flex flex-row items-center`, wrapper: `mr-2` }}
                />
              )}
            </div>
            <div className="flex flex-row mt-6 items-center">
              <p className="mr-3">SIZE:</p>
              {size && (
                <Repeatable
                  Element={({ element }) => (
                    <>
                      <input
                        type="radio"
                        className="absolute w-full h-full -z-10 scale-90"
                        id={element}
                        name="size"
                        onChange={(e) => setSelectedSize(e.target.value)}
                        value={element.replace(/\b(waist|shoe)\s/g, '')}
                      />
                      <label
                        htmlFor={`${element}`}
                        className={`min-w-[2.5rem] py-3 inline-block p-1 border pointer text-center ${
                          selectedSize === element.replace(/\b(waist|shoe)\s/g, '')
                            ? 'bg-gray-600  text-white'
                            : 'bg-white'
                        }`}>
                        {element.replace(/\b(waist|shoe)\s/g, '')}
                      </label>
                    </>
                  )}
                  elements={size}
                  pre="color"
                  style={{
                    container: `flex flex-row flex-wrap items-center max-w-[15.5rem]`,
                    wrapper: `relative mt-3 mr-2 `
                  }}
                />
              )}
            </div>
            <div className="mt-12">
              {sizeError && <p className="py-2 normal-case text-red-600">{sizeError}!</p>}
              <div className="flex gap-3 justify-stretch flex-row uppercase">
                <button
                  className="w-full text-white font-semibold bg-gray-600 max-w-sm"
                  type="button"
                  onClick={cartHandler}>
                  Add to cart
                </button>
              </div>
            </div>
            <div className="mt-12 flex flex-col minw-w-[85%] uppercase">
              <h3>PRODUCT DETAILS</h3>
              <p className="mt-6">{description?.content}</p>
              <div dangerouslySetInnerHTML={createMarkup()} />
            </div>
          </div>
        </div>
      )}
      {relatedProducts && relatedProducts.data && (
        <div className="md:mt-12 lg:mt-20">
          <h1
            className="flex flex-row min-w-56
            uppercase ">
            WE ALSO RECOMMEND
          </h1>
          <Repeatable
            Element={ProductCard}
            elements={relatedProducts}
            style={{
              container: `mt-6
          flex flex-col gap-4 
          md:grid md:grid-cols-4  md:gap-8`,
              wrapper: `md:col-span-1 md:col-span-1`
            }}
            pre="product"
          />
        </div>
      )}
    </section>
  )
}
export default Product
