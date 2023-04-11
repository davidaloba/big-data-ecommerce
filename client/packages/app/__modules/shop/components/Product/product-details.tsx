import ProductCard from '@appModules/shop/components/ProductCard'
import { useGetRelatedProductsQuery } from '@appModules/shop/store/api'
import { getStrapiMedia, numberWithCommas } from '@globalUtils/index'
import Repeatable from '@marketingComponents/__lib/Repeatable'
import Image from 'next/image'
import Link from 'next/link'
import { useState } from 'react'

const ProductInfo = ({
  slug,
  name,
  featuredImage,
  hoverImage,
  price,
  color,
  size,
  category,
  gallery,
  description
}: {
  slug
  name
  featuredImage
  hoverImage
  category
  price
  color
  size
  gallery
  description
}) => {
  const [selectedSize, setSelectedSize] = useState('')
  const { data: products, isSuccess } = useGetRelatedProductsQuery({
    category: category.data.attributes.slug,
    slug
  })
  console.log(products)

  return (
    <section className=" pb-20 pt-0 px-8 md:px-12 lg:px-16 2xl:px-20">
      <div className="flex flex-col lg:flex-row">
        <div className=" lg:w-[65vw] bg-gray-100 lg:-ml-12 group">
          {featuredImage && (
            <Image
              className="group-hover:hidden "
              src={getStrapiMedia(featuredImage.data.attributes.url)}
              alt="logo"
              width="600"
              height="20"
            />
          )}
          {hoverImage && (
            <Image
              className="hidden group-hover:block "
              src={getStrapiMedia(hoverImage.data.attributes.url)}
              alt="logo"
              width="600"
              height="20"
            />
          )}
        </div>
        <div
          className="flex flex-col 
            lg:w-[40%] lg:ml-[44px] 
            uppercase">
          <div
            className="flex flex-row min-w-56
            uppercase ">
            <Link
              className="md:mr-3"
              href="/shop">
              SHOP
            </Link>
            {category && (
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
          {name && <p className="mt-20 lg:mt-7 text-base">{name}</p>}
          {price && <p className="mt-7">PRICE: ${numberWithCommas(price)}</p>}
          {color && (
            <div className="flex flex-row mt-6 items-center">
              <p className="mr-3">COLOR:</p>
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
            </div>
          )}
          {size && (
            <div className="flex flex-row mt-6 items-center">
              <p className="mr-3">SIZE:</p>
              <Repeatable
                Element={({ element }) => (
                  <>
                    <input
                      type="radio"
                      className="absolute w-full h-full -z-10 scale-90 "
                      id={element}
                      name="size"
                      onChange={(e) => setSelectedSize(e.target.value)}
                      value={element.replace(/\b(waist|shoe)\s/g, '')}></input>
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
            </div>
          )}
          <div
            className=" flex gap-3 justify-stretch flex-row 
          mt-12   uppercase ">
            <Link
              className=" w-full"
              href="#">
              <button
                className="w-full text-white font-semibold bg-gray-600"
                type="button">
                Add to cart
              </button>
            </Link>
            <Link
              className=" w-full"
              href="#">
              <button
                className="w-full"
                type="button">
                add to Wishlist
              </button>
            </Link>
          </div>
          <div className="mt-12 flex flex-col minw-w-[85%]  uppercase">
            <h3>PRODUCT DETAILS</h3>
            <p className=" mt-6">{description.content}</p>
          </div>
        </div>
      </div>
      <div className="md:mt-12 lg:mt-20">
        <h1
          className="flex flex-row min-w-56
            uppercase ">
          WE ALSO RECOMMEND
        </h1>
        {isSuccess && (
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
        )}
      </div>
    </section>
  )
}

export default ProductInfo
