'use client'
import { useEffect, useState } from 'react'
import { RootState, useAppSelector } from '@app/_global/store/index'
import MobileNav from './mobilenav'
import DesktopNav from './desktopnav'

const Navigation = ({ logo, logoWidth, navMenu, shopMenu }) => {
  const { items } = useAppSelector((state: RootState) => state.cart)
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
      <DesktopNav
        navMenu={navMenu}
        shopMenu={shopMenu}
        logo={logo}
        logoWidth={logoWidth}
        cartCount={cartCount}
      />
      <MobileNav
        navMenu={navMenu}
        shopMenu={shopMenu}
        logo={logo}
        logoWidth={logoWidth}
        cartCount={cartCount}
      />
    </header>
  )
}

export default Navigation
