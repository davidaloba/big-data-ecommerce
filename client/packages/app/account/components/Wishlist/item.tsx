'use client'
import Link from 'next/link'
import Image from 'next/image'
import { getStrapiMedia, numberWithCommas } from '@app/_global/utils/index'
import { useAppDispatch } from '@app/_global/store/index'
import { addToCart, openCart } from '@app/shop/store/cart.slice'
import Repeatable from '@globalComponents/__lib/Repeatable'
import { useState } from 'react'
import { useRemoveFromWishlistMutation } from '@app/account/store/wishlist.api'

const WishlistItem = ({ item, i }) => {
  const [removeFromWishlist] = useRemoveFromWishlistMutation()
  const dispatch = useAppDispatch()

  const [sizeError, setSizeError] = useState('')
  const [selectedSize, setSelectedSize] = useState('')
  const cartHandler = (item) => {
    if (!selectedSize) {
      setSizeError('Please select a size')
      setTimeout(() => setSizeError(''), 3000)
      return
    }

    dispatch(
      addToCart({
        name: item.name,
        slug: item.slug,
        featuredImage: item.featuredImage?.data?.attributes?.url,
        selectedSize,
        price: item.price
      })
    )
    dispatch(openCart(true))
    removeFromWishlist(item.id)
    setSizeError('')
    setTimeout(() => dispatch(openCart(false)), 3000)
  }
  return (
    <div
      key={i}
      className="flex flex-row justify-between px-5 py-5 border-b last:border-b-0 ">
      <div className="flex flex-row">
        <Link
          className="w-[120px] md:w-[160px]"
          href={`/shop/${item.slug}`}>
          <Image
            src={getStrapiMedia(item.featuredImage.url)}
            alt="logo"
            width="160"
            height="0"
          />
        </Link>
        <div className="flex flex-col grow justify-between  gap-6 ml-4 ">
          <Link href={`/shop/${item.slug}`}>
            <p className="">{item.name}</p>
          </Link>
          <div>
            <div className="flex flex-col justify-start items-start">
              <p className="mr-3">SIZE:</p>
              {item.size && (
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
                        className={` min-w-[30px] inline-block p-1 border pointer text-center ${
                          selectedSize === element.replace(/\b(waist|shoe)\s/g, '')
                            ? 'bg-gray-600  text-white'
                            : 'bg-white'
                        }`}>
                        {element.replace(/\b(waist|shoe)\s/g, '')}
                      </label>
                    </>
                  )}
                  elements={item.size}
                  pre="color"
                  style={{
                    container: `flex flex-row flex-wrap items-center max-w-[15.5rem]`,
                    wrapper: `relative mt-1 mr-1 `
                  }}
                />
              )}
            </div>
            {item.color && <p className="mt-2">Color: {item.color[0].label}</p>}
          </div>
          <div>
            {sizeError && <p className=" normal-case text-red-600">{sizeError}!</p>}
            <div
              className={`${
                !selectedSize && 'text-gray-400'
              } border-0 underline hover:no-underline py-1 uppercase`}
              onClick={() => {
                cartHandler(item)
              }}>
              Add to Cart
            </div>
          </div>
        </div>
      </div>
      <div className="flex flex-col justify-between ">
        <p className="">${numberWithCommas(item.price)}</p>
        <div
          className="  border-0 underline hover:no-underline py-1 uppercase"
          onClick={() => {
            removeFromWishlist(item.id)
          }}>
          Remove
        </div>
      </div>
    </div>
  )
}

export default WishlistItem
