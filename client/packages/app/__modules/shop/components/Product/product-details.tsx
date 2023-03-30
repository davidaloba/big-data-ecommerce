import { getStrapiMedia, numberWithCommas } from '@globalUtils/index'
import Image from 'next/image'
import Link from 'next/link'

const ProductInfo = ({
  name,
  price,
  categories,
  content,
  featuredImages
}: {
  name?
  price?
  categories?
  content?
  featuredImages?
}) => {
  return (
    <section className="flex flex-col lg:flex-row py-0 px-6 md:px-8 lg:px-12 2xl:px-14">
      {featuredImages && (
        <div
          className="lg:w-[65vw] bg-gray-100 lg:-ml-12
          group">
          <Image
            className="hidden group-hover:block "
            src={getStrapiMedia(featuredImages.data[0].attributes.url)}
            alt="logo"
            width="600"
            height="20"
          />
          <Image
            className=" group-hover:hidden"
            src={getStrapiMedia(featuredImages.data[1].attributes.url)}
            alt="logo"
            width="600"
            height="20"
          />
        </div>
      )}
      <div className="flex flex-col lg:w-[40%] uppercase lg:ml-[44px] ">
        {categories && (
          <div
            className="flex flex-row min-w-56
             uppercase ">
            <Link
              className="md:mr-3"
              href="/shop">
              SHOP
            </Link>
            <p>/</p>
            <Link
              className="md:ml-3"
              href={`/category/${categories.data[0].attributes.slug}`}>
              {categories.data[0].attributes.name}
            </Link>
          </div>
        )}
        {name && <p className="mt-7 text-base">{name}</p>}
        {price && <p className="mt-7">${numberWithCommas(price)}</p>}
        {price && <p className="mt-6">COLOR:{numberWithCommas(price)}</p>}
        {price && <p className="mt-6">SIZE:{numberWithCommas(price)}</p>}
        <div className="mt-12 flex flex-col minw-w-[85%]  uppercase">
          <Link href="#">
            <button
              type="button"
              className="w-full">
              Add to cart
            </button>
          </Link>
          <div className="flex gap-3 justify-stretch flex-row mt-2">
            <Link
              className=" w-full"
              href="#">
              <button
                className="w-full"
                type="button">
                add to Wishlist
              </button>
            </Link>
            <Link
              className=" w-full"
              href="#">
              <button
                className="w-full"
                type="button">
                Find in Store
              </button>
            </Link>
          </div>
        </div>
        <div className="mt-12 flex flex-col minw-w-[85%]  uppercase">
          <h3>PRODUCT DETAILS</h3>
          <p className=" mt-6">content.description</p>
        </div>
      </div>
    </section>
  )
}

export default ProductInfo
