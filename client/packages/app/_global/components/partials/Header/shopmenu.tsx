'use client'

import { RootState, useAppSelector } from '@globalStore/index'

import Link from 'next/link'
import Menu from './menu'
import MenuLink from './menulink'
import MenuCart from './menu-cart'
import MenuWishlist from './menu-wishlist'
import AccountMenu from './account-menu'
import { useGetWishlistQuery } from '@app/account/store/wishlist.api'

const ShopMenu = ({ navMenu, cartCount, wishlistCount }) => {
  const { userToken } = useAppSelector((state: RootState) => state.account)
  const { data: wishlist, isSuccess } = useGetWishlistQuery('wishlist')

  return (
    <>
      {navMenu.length > 0 && <Menu links={navMenu} />}
      <ul className="flex flex-row">
        {userToken ? (
          <>
            <li className=" ">
              <div className="relative group   ">
                <div className="relative z-10 p-1 group-hover:underline group-hover:bg-white border border-b-0 group-hover:border-gray-200  border-white ">
                  <Link href="/account/profile">My Account</Link>
                </div>
                <AccountMenu />
              </div>
            </li>
            {isSuccess && wishlist.length > 0 && (
              <li className="  ">
                <div className="relative group  ">
                  <div className="relative z-10 p-1 group-hover:underline group-hover:bg-white border border-b-0 group-hover:border-gray-200  border-white ">
                    <Link href="/account/wishlist">Wishlist {`${wishlist.length}`}</Link>
                  </div>
                  <MenuWishlist />
                </div>
              </li>
            )}
          </>
        ) : (
          <li className="">
            <MenuLink
              href="account/login"
              label="LOG IN"
            />
          </li>
        )}
        <li className="">
          <div className="relative group  ">
            <div className="relative z-10 p-1 group-hover:underline group-hover:bg-white border border-b-0 group-hover:border-gray-200  border-white ">
              <Link href="/cart">CART{`${cartCount}`}</Link>
            </div>
            <MenuCart />
          </div>
        </li>
      </ul>
    </>
  )
}

export default ShopMenu
