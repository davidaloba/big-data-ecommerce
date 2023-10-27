import { useState } from 'react'

import Image from 'next/image'
import Link from 'next/link'
import Repeatable from '@app/_global/components/__lib/Repeatable'

import { getStrapiMedia } from '@app/_global/utils/index'

const CategoryCard = ({ title, subTitle, featuredImage, links, imageLinks, index }) => {
  const [openMenu, setOpenMenu] = useState(false)

  return (
    <div className={`group relative px-0 pb-0 pt-0`}>
      <Image
        onClick={() => setOpenMenu(!openMenu)}
        className=" -z-10 filter group-hover:filter-none saturate-0 transition duration-300 ease-in-out "
        src={getStrapiMedia(featuredImage.data.attributes.url)}
        alt="logo"
        width="1920"
        height="1080"
      />
      <div
        className="`absolute top-2 left-2
      absolute md:top-4 lg:top-[26px] 2xl:top-[30px]  md:left-5 lg:left-9 z-10 flex items-start justify-start`">
        <div
          onClick={() => setOpenMenu(!openMenu)}
          className={`${
            openMenu && 'text-white '
          } text-3xl lg:text-4xl 2xl:text-4xl leading-4 lg:leading-5 2xl:leading-6 mr-2 lg:mr-4 2xl:mr-8 `}>
          {openMenu ? 'x' : '+'}
        </div>
        <div onClick={() => setOpenMenu(!openMenu)}>
          <h3 className={` ${openMenu && 'text-white '} font-semibold uppercase `}>{title}</h3>
          {subTitle && (
            <h3 className={` ${openMenu && 'text-white '} font-semibold uppercase `}>{subTitle}</h3>
          )}
        </div>
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
            Element={({ href, label }) => {
              return (
                <div className=" uppercase p-1 text-xl lg:text-2xl 2xl:text-3xl font-bold text-white  hover:text-gray-400">
                  <Link href={`/category/${href}`}>{label}</Link>
                </div>
              )
            }}
            elements={links}
            style={{
              container: 'static',
              wrapper: `
                lg:mb-2 2xl:mb-[3] 
                `
            }}
            pre="category"
          />
          {index % 3 === 0 && (
            <Repeatable
              Element={({ featuredImages, href, label }) => (
                <div className="">
                  <Link
                    href={href}
                    className="group">
                    <Image
                      onClick={() => setOpenMenu(!openMenu)}
                      className="hidden group-hover:block -z-10"
                      src={getStrapiMedia(featuredImages.data[0].attributes.url)}
                      alt="logo"
                      width="600"
                      height="20"
                    />
                    <Image
                      onClick={() => setOpenMenu(!openMenu)}
                      className=" group-hover:hidden -z-10"
                      src={getStrapiMedia(featuredImages.data[1].attributes.url)}
                      alt="logo"
                      width="600"
                      height="20"
                    />
                  </Link>
                  <h4
                    className="mt-3 
                      text-sm lg:text-lg font-semibold text-white hover:text-gray-300">
                    {label}
                  </h4>
                </div>
              )}
              elements={imageLinks}
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
    </div>
  )
}

export default CategoryCard
