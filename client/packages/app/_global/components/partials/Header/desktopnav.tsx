import Image from 'next/image'
import Cookies from 'js-cookie'
import { getStrapiMedia } from '@app/_global/utils/index'
import Menu from './menu'
import MegaMenu from './megamenu'
import Link from 'next/link'
import MenuLink from './menulink'
import MenuCart from './menu-cart'

const DesktopNav = ({ navMenu, shopMenu, logo, logoWidth, cartCount }) => {
  const user = Cookies.get('user') ? JSON.parse(Cookies.get('user')) : Cookies.get('user')
  console.log(user)

  return (
    <nav
      className="hidden px-4 md:px-6 lg:px-8 2xl:px-12 py-2
      md:flex flex-row items-center justify-between bg-white ">
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
          <li className="flex-1  ">
            {user ? (
              <MenuLink
                href="/account"
                label="My Account"
              />
            ) : (
              <MenuLink
                href="/account/login"
                label="LOG IN"
              />
            )}
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
  )
}

export default DesktopNav
