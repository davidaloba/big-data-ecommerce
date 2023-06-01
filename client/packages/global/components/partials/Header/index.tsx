'use client'
import { useEffect, useState } from 'react'
import { RootState, useAppSelector } from '@globalStore/index'
import MobileNav from './mobilenav'
import DesktopNav from './desktopnav'

const Navigation = ({ logo, navMenu, shopMenu }) => {
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
        cartCount={cartCount}
      />
      <MobileNav
        navMenu={navMenu}
        shopMenu={shopMenu}
        logo={logo}
        cartCount={cartCount}
      />
    </header>
  )
}

export default Navigation
