'use client'
import { useState } from 'react'
import Image from 'next/image'
import { getStrapiMedia } from 'packages/global/utils/index'
import Menu from './menu'
import MegaMenu from './megamenu'
import MobileNav from './mobilenav'
import Link from 'next/link'

const Navigation = ({ logo, navMenu, shopMenu }) => {
  const [mobileMenu, setMobileMenu] = useState(false)

  return (
    <header className=" sticky top-0 z-50 ">
      <nav
        className="px-4 md:px-6 lg:px-8 2xl:px-12 
        flex flex-row items-center justify-between  border bg-white ">
        {shopMenu[0] && <MegaMenu columns={shopMenu} />}
        {logo.data && (
          <Link href="/">
            <Image
              src={getStrapiMedia(logo.data.attributes.url)}
              alt="logo"
              width="52"
              height="52"
            />
          </Link>
        )}
        {navMenu[0] && <Menu links={navMenu} />}
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
