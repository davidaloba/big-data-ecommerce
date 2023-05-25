'use client'
import { useEffect, useState } from 'react'
import Image from 'next/image'
import { RootState, useAppSelector } from '@globalStore/index'
import { getStrapiMedia } from 'packages/global/utils/index'
import Menu from './menu'
import MegaMenu from './megamenu'
import MobileNav from './mobilenav'
import Link from 'next/link'
import MenuLink from './menulink'
import MenuCart from './menu-cart'

const Navigation = ({ logo, navMenu, shopMenu }) => {
  const { items } = useAppSelector((state: RootState) => state.cart)
  const [mobileMenu, setMobileMenu] = useState(false)
  const [cartCount, setCartCount] = useState('')

  useEffect(() => {
    const count =
      items &&
      (items.reduce((prev, current) => prev + current.qty, 0) !== 0
        ? ` ${items.reduce((prev, current) => prev + current.qty, 0)}`
        : '')
    setCartCount(count)
  }, [items])

  return (
    <header className=" sticky top-0 z-50 ">
      <nav
        className="px-4 md:px-6 lg:px-8 2xl:px-12 py-2
        flex flex-row items-center justify-between  bg-white ">
        {shopMenu.length > 0 && <div className="flex-1">{<MegaMenu columns={shopMenu} />}</div>}
        <Link href="/">
          <Image
            src={logo && logo.data ? getStrapiMedia(logo.data.attributes.url) : `/avatar.png`}
            alt="logo"
            width="52"
            height="52"
          />
        </Link>
        <div className="flex flex-row flex-1 justify-end">
          {navMenu.length > 0 && <Menu links={navMenu} />}
          <ul className="flex flex-row">
            <li className="flex-1  ">
              <MenuLink
                href="login"
                label="LOG IN"
              />
            </li>
            <li className="">
              <div className="relative group ">
                <p className="relative z-10 px-1 py-1 group-hover:underline group-hover:bg-white border border-b-0 group-hover:border-gray-200  border-white ">
                  CART{`${cartCount}`}
                </p>
                <MenuCart />
              </div>
            </li>
          </ul>
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
