import { getStrapiMedia } from '@app/_global/utils/index'
import { RootState, useAppSelector } from '@globalStore/index'

import Image from 'next/image'
import Link from 'next/link'
import Menu from './menu'
import MegaMenu from './megamenu'
import MenuLink from './menulink'
import MenuCart from './menu-cart'
import AccountMenu from './account-menu'

const DesktopNav = ({ navMenu, shopMenu, logo, logoWidth, cartCount }) => {
  const { user } = useAppSelector((state: RootState) => state.account)
  return (
    <nav
      className="hidden px-4 md:px-6 lg:px-8 2xl:px-12 py-2
      md:flex flex-row items-center justify-between bg-white uppercase">
      <div className="flex-1">{shopMenu.length > 0 && <MegaMenu columns={shopMenu} />}</div>
      <Link href="/">
        <Image
          src={logo && logo.data ? getStrapiMedia(logo.data.attributes.url) : `/avatar.png`}
          alt="logo"
          width={logoWidth || '44'}
          height="44"
        />
      </Link>
      <div className="flex flex-row flex-1 justify-end">
        {navMenu.length > 0 && <Menu links={navMenu} />}
        <ul className="flex flex-row">
          {user ? (
            <>
              <li className=" ">
                <div className="relative group   ">
                  <div className="relative z-10 p-1 group-hover:underline group-hover:bg-white border border-b-0 group-hover:border-gray-200  border-white ">
                    <Link href="account/profile">My Account</Link>
                  </div>
                  <AccountMenu />
                </div>
              </li>
              <li className="  ">
                <MenuLink
                  href="account/wishlist"
                  label={`Wishlist ${cartCount}`}></MenuLink>
              </li>
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
                <Link href="cart">CART{`${cartCount}`}</Link>
              </div>
              <MenuCart />
            </div>
          </li>
        </ul>
      </div>
    </nav>
  )
}

export default DesktopNav
