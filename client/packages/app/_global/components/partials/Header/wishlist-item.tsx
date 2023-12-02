'use client'
import { useAppDispatch } from '@app/_global/store/index'
import Image from 'next/image'
import Link from 'next/link'
import { getStrapiMedia, numberWithCommas } from '@app/_global/utils/index'
import { addToCart } from '@app/shop/store/cart.slice'
import { useState } from 'react'
import { useRemoveFromWishlistMutation } from '@app/account/store/wishlist.api'

const WishListMenuItem = ({ item, i }) => {
  const [removeFromWishlist] = useRemoveFromWishlistMutation()

  const [selectedSize, setSelectedSize] = useState('')
  const cartHandler = () => {
    dispatch(
      addToCart({
        name: item.name,
        slug: item.slug,
        featuredImage: item.featuredImage?.data?.attributes?.url,
        selectedSize,
        price: item.price
      })
    )
    removeFromWishlist(item.id)
  }
  const dispatch = useAppDispatch()

  return (
    <div
      key={i}
      className="flex flex-row  px-4 py-6 border-b ">
      <Link href={`/shop/${item.slug}`}>
        <Image
          src={getStrapiMedia(item.featuredImage.url)}
          alt="logo"
          width="120"
          height="80"
        />
      </Link>
      <div className="flex flex-col grow justify-between ml-4">
        <div className="flex flex-row  justify-between">
          <div className="flex flex-col gap-1 ">
            <p>{item.name}</p>
            <div
              className=" border-0 underline hover:no-underline py-1 uppercase"
              onClick={() => {
                removeFromWishlist(item.id)
              }}>
              Remove
            </div>
          </div>
          <p>${numberWithCommas(item.price)}</p>
        </div>
        <div className="flex gap-1 justify-stretch flex-row uppercase">
          <select
            className={` invalid:border-red-500 }`}
            onChange={(e) => setSelectedSize(e.target.value)}
            defaultValue="">
            <option
              disabled
              hidden
              value="">
              -- select an option --
            </option>
            {item.size.map((size, i) => (
              <option
                key={i}
                value={size}>
                {size}
              </option>
            ))}
          </select>
          <button
            className={`"w-full border ${
              selectedSize !== '' ? 'border-gray-600  bg-gray-600' : 'border-gray-300  bg-gray-300'
            }  text-white font-semibold max-w-sm"`}
            onClick={() => {
              selectedSize !== '' && cartHandler()
            }}>
            Add to cart
          </button>
        </div>
      </div>
    </div>
  )
}

export default WishListMenuItem
