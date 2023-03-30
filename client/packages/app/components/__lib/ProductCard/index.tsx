import Link from 'next/link'
import { getStrapiMedia, numberWithCommas } from 'packages/global/utils/index'
import Image from 'next/image'

const ProductCard = ({ attributes }) => {
  const { featuredImages, slug, name, price } = attributes
  return (
    <Link
      className="overflow-hidden shadow-lg rounded-lg h-90 w-full cursor-pointer"
      href={`shop/${slug}`}>
      {featuredImages && (
        <div className="group">
          <Image
            className="hidden group-hover:block -z-10"
            src={getStrapiMedia(featuredImages.data[0].attributes.url)}
            alt="logo"
            width="600"
            height="20"
          />
          <Image
            className=" group-hover:hidden -z-10"
            src={getStrapiMedia(featuredImages.data[1].attributes.url)}
            alt="logo"
            width="600"
            height="20"
          />
        </div>
      )}
      <div className=" mt-2 uppercase text-center ">
        {name && <p>{name}</p>}
        {price && <p>${numberWithCommas(price)}</p>}
      </div>
    </Link>
  )
}

export default ProductCard
