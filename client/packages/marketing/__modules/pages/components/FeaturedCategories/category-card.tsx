'use client'
import { useState } from 'react'

import Image from 'next/image'
import Link from 'next/link'
import MenuLink from '@globalComponents/partials/Header/menulink'
import Repeatable from '@globalComponents/__lib/Repeatable'

import { getStrapiMedia } from '@globalUtils/index'

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
  const [openMenu, setOpenMenu] = useState(true)

  return (
    <section className={`relative px-0 pb-0 pt-0`}>
      <Image
        onClick={() => setOpenMenu(!openMenu)}
        className=" -z-10"
        src={getStrapiMedia(featuredImage.data.attributes.url)}
        alt="logo"
        width="1366"
        height="52"
      />
      <div
        className="`absolute top-2 left-2
      absolute md:top-4 lg:top-[26px] 2xl:top-[30px]  md:left-5 lg:left-9 z-10 flex items-start justify-start`">
        <div
          onClick={() => setOpenMenu(!openMenu)}
          className={`${
            !openMenu ? 'lack' : 'text-white '
          } text-3xl lg:text-4xl 2xl:text-4xl leading-4 lg:leading-5 2xl:leading-6 mr-2 lg:mr-4 2xl:mr-8 `}>
          {openMenu ? 'x' : '+'}
        </div>
        {!link ? (
          <div onClick={() => setOpenMenu(!openMenu)}>
            <h3 className={` ${!openMenu ? 'lack' : 'text-white '} font-semibold  `}>{label}S</h3>
            <h3 className={` ${!openMenu ? 'lack' : 'text-white '} font-semibold  `}>NEW IN</h3>
          </div>
        ) : (
          <Link
            className="hover:underline decoration-white"
            href={link}>
            <h3 className={` ${!openMenu ? 'lack' : 'text-white '} font-semibold  `}>{label}S</h3>
            <h3 className={` ${!openMenu ? 'lack' : 'text-white '} font-semibold  `}>NEW IN</h3>
          </Link>
        )}
      </div>
      {openMenu && (
        <div
          onClick={() => setOpenMenu(!openMenu)}
          className="absolute top-0  
            h-full w-full 
            pt-16 px-8
            md:pt-16 md:px-11
            lg:pt-[88px] 2xl:pt-[100px] lg:px-[70px] 2xl:px-[84px]
          bg-black bg-opacity-80">
          <Repeatable
            Element={MenuLink}
            elements={featuredLinks}
            style={{
              container: 'static',
              wrapper: `
                lg:mb-2 2xl:mb-[3] 
                text-xl lg:text-2xl 2xl:text-3xl font-bold text-white  hover:text-gray-300`
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
                  <h4
                    className="mt-3 
                      text-sm lg:text-lg font-semibold text-white hover:text-gray-300">
                    {attributes.name}
                  </h4>
                </div>
              )}
              elements={subCategories.data}
              style={{
                container: `hidden 
                  md:flex md:flex-row md:mt-8 md:justify-between
                  md:w-full`,
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
