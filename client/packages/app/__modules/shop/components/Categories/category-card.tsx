import MenuLink from '@appComponents/partials/Header/menulink'
import Repeatable from '@appComponents/__lib/Repeatable'
import { getStrapiMedia } from '@globalUtils/index'
import { SUBRESOURCE_INTEGRITY_MANIFEST } from 'next/dist/shared/lib/constants'
import Image from 'next/image'
import Link from 'next/link'
import { useState } from 'react'

const CategoryCard = ({
  category,
  label,
  link,
  featuredImage,
  featuredLinks,
  subCategories,
  children,
  index
}) => {
  console.log(subCategories)

  const [openMenu, setOpenMenu] = useState(true)

  const bgImg = getStrapiMedia(featuredImage.data.attributes.url)

  return (
    <section className={`relative px-0 lg:px-0 pt-0 pb-0 md:pt-0 md:pb-0`}>
      <Image
        onClick={() => setOpenMenu(!openMenu)}
        className=" -z-10"
        src={bgImg}
        alt="logo"
        width="1366"
        height="52"
      />
      <div className="absolute top-7 left-8 z-10 flex items-start justify-start">
        <div
          onClick={() => setOpenMenu(!openMenu)}
          className={`${!openMenu ? 'text-black' : 'text-white '} text-5xl leading-5 mr-6 `}>
          {openMenu ? 'x' : '+'}
        </div>
        {!link ? (
          <div onClick={() => setOpenMenu(!openMenu)}>
            <h3 className={` ${!openMenu ? 'text-black' : 'text-white '} font-semibold text-xs `}>
              {label}S
            </h3>
            <h3 className={` ${!openMenu ? 'text-black' : 'text-white '} font-semibold text-xs `}>
              NEW IN
            </h3>
          </div>
        ) : (
          <Link
            className="hover:underline decoration-white"
            href={link}>
            <h3 className={` ${!openMenu ? 'text-black' : 'text-white '} font-semibold text-xs `}>
              {label}S
            </h3>
            <h3 className={` ${!openMenu ? 'text-black' : 'text-white '} font-semibold text-xs `}>
              NEW IN
            </h3>
          </Link>
        )}
      </div>
      {openMenu && (
        <div
          onClick={() => setOpenMenu(!openMenu)}
          className="absolute top-0 bg-black bg-opacity-80 h-full w-full pt-[100px] px-[84px]">
          <Repeatable
            Element={MenuLink}
            elements={featuredLinks}
            style={{
              container: 'static',
              wrapper: ' mb-3 text-3xl font-bold text-white hover:text-gray-300'
            }}
            pre="category"
          />
          {index === (2 || 5) && (
            <Repeatable
              Element={({ attributes }) => (
                <div className="">
                  <Link
                    href={`/category/${attributes.slug}`}
                    className="group">
                    <Image
                      onClick={() => setOpenMenu(!openMenu)}
                      className="hidden group-hover:block -z-10"
                      src="/dgc.png"
                      alt="logo"
                      width="600"
                      height="20"
                    />
                    <Image
                      onClick={() => setOpenMenu(!openMenu)}
                      className=" group-hover:hidden -z-10"
                      src="/olla.png"
                      alt="logo"
                      width="600"
                      height="20"
                    />
                  </Link>
                  <h4 className="mt-3 text-lg font-semibold text-white hover:text-gray-300">
                    {attributes.name}
                  </h4>
                </div>
              )}
              elements={subCategories.data}
              style={{
                container: 'w-full flex flex-row mt-8 justify-between',
                wrapper: 'w-[23%] '
              }}
              pre="category"
            />
          )}
        </div>
      )}
    </section>
  )
}

export default CategoryCard
