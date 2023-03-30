'use client'
import { useState } from 'react'

import Image from 'next/image'
import Menu from './menu'
import MobileNav from './mobilenav'

import { getStrapiMedia } from 'packages/global/utils/index'

const Navigation = ({ logo, navMenu }) => {
  const [mobileMenu, setMobileMenu] = useState(false)

  return (
    <header className=" sticky top-0 z-50 ">
      <nav
        className="px-2 xl:px-4 py-2
        flex flex-row items-center justify-between
       bg-gray-50 ">
        {logo && (
          <Image
            src={getStrapiMedia(logo.data.attributes.url)}
            alt="logo"
            width="52"
            height="52"
          />
        )}
        {navMenu[0] && (
          <Menu
            style="md:flex md:flex-row flex-wrap items-center justify-end
            hidden"
            links={navMenu}
          />
        )}
        {/* mobile navigation toggle */}
        <div
          className=" py-1 px-4 text-sm
              md:hidden
              font-semibold 
              cursor-pointer shadow rounded-lg bg-white "
          onClick={() => setMobileMenu(!mobileMenu)}>
          Menu
        </div>
      </nav>
      <MobileNav
        mobileMenu={mobileMenu}
        setMobileMenu={setMobileMenu}
        navMenu={navMenu}
      />
    </header>
  )
}

export default Navigation
