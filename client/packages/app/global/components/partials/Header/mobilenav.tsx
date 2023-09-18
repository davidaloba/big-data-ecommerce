import Image from 'next/image'
import { getStrapiMedia } from '@globalUtils/index'
import Link from 'next/link'
import MenuCart from './menu-cart'
import { useState } from 'react'
import MobileMenu from './mobilemenu'

const MobileNav = ({ navMenu, shopMenu, logo, logoWidth, cartCount }) => {
  const [mobileMenu, setMobileMenu] = useState(false)

  return (
    <>
      <nav className="flex flex-row items-center justify-between  bg-white md:hidden px-4 md:px-6 lg:px-8 2xl:px-12 py-2 ">
        <div className=" flex-1">
          <div
            className=" z-20 py-1 px-4 text-sm w-max
              font-semibold cursor-pointer shadow rounded-lg bg-white "
            onClick={() => setMobileMenu(!mobileMenu)}>
            Menu
          </div>
        </div>
        <Link href="/">
          <Image
            src={logo && logo.data ? getStrapiMedia(logo.data.attributes.url) : `/avatar.png`}
            alt="logo"
            width={logoWidth || '44'}
            height="44"
          />
        </Link>
        <div className="flex flex-row flex-1 justify-end">
          <div className="relative group ">
            <p className="relative z-10 px-1 py-1 group-hover:underline group-hover:bg-white border border-b-0 group-hover:border-gray-200  border-white ">
              CART{`${cartCount}`}
            </p>
            <MenuCart />
          </div>
        </div>
      </nav>
      <MobileMenu
        navMenu={navMenu}
        shopMenu={shopMenu}
        logo={logo}
        cartCount={cartCount}
        mobileMenu={mobileMenu}
        setMobileMenu={setMobileMenu}
      />
    </>
  )
}

export default MobileNav
