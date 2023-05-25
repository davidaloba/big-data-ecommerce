import Link from 'next/link'
import { getStrapiMedia, numberWithCommas, fetchHoverImg } from 'packages/global/utils/index'
import Image from 'next/image'
import Repeatable from '@globalComponents/__lib/Repeatable'
import { useState } from 'react'

const ProductCard = ({ attributes }) => {
  const { featuredImage, hoverImage, slug, name, price, color } = attributes
  const [hoverImg, setHoverImg] = useState(getStrapiMedia(hoverImage.data.attributes.url))

  return (
    <div className=" w-full cursor-pointer">
      <div className="relative group">
        <Link href={`shop/${slug}`}>
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
              className=" hidden group-hover:block"
              src={hoverImg}
              alt="logo"
              width="600"
              height="20"
            />
          )}
        </Link>
        {color.length > 1 && (
          <div
            className="absolute bottom-0
              hidden group-hover:flex flex-row items-center justify-between
              w-full py-2
              border-b bg-white">
            <p>MORE COLORS:</p>
            <Repeatable
              Element={({ label, slug, swatch }) => (
                <Link
                  href={`shop/${slug}`}
                  onMouseOver={() => fetchHoverImg(slug, setHoverImg)}>
                  <Image
                    src={getStrapiMedia(swatch.data.attributes.url)}
                    alt={`${label}`}
                    height="16"
                    width="16"
                  />
                </Link>
              )}
              elements={color}
              pre="color"
              style={{
                container: `flex flex-row items-center justify-end px-0`,
                wrapper: `ml-2`
              }}
            />
          </div>
        )}
      </div>
      <Link href={`shop/${slug}`}>
        <div className=" mt-2 uppercase text-center ">
          {name && <p>{name}</p>}
          {price && <p>${numberWithCommas(price)}</p>}
        </div>
      </Link>
    </div>
  )
}

export default ProductCard
