import Image from 'next/image'
import { getStrapiMedia } from 'packages/global/utils/index'
import Menu from './menu'
import Link from 'next/link'
import MenuCart from './menu-cart'
import Repeatable from '@globalComponents/__lib/Repeatable'
import MenuLink from './menulink'

const MobileMenu = ({ navMenu, shopMenu, logo, cartCount, mobileMenu, setMobileMenu }) => {
  return (
    <div
      className={`mr-4 ${
        !mobileMenu && 'hidden'
      } fixed z-20 top-0 w-full h-full bg-black bg-opacity-80`}>
      <div className="mx-4 my-2 flex flex-row items-center justify-between">
        <div className=" flex-1">
          <div
            className=" z-20 py-1 px-4 text-sm w-max
          font-semibold cursor-pointer shadow rounded-lg bg-white "
            onClick={() => setMobileMenu(!mobileMenu)}>
            {mobileMenu ? 'Close' : 'Menu'}
          </div>
        </div>
        <Link href="/">
          <Image
            src={logo && logo.data ? getStrapiMedia(logo.data.attributes.url) : `/avatar.png`}
            alt="logo"
            width="44"
            height="44"
          />
        </Link>
        <div className="flex flex-row flex-1 justify-end">
          <div className="relative group ">
            <p className=" z-10 px-1 py-1 text-white  ">CART{`${cartCount}`}</p>
            <MenuCart />
          </div>
        </div>
      </div>
      <div className="mx-4 my-2 ">
        <Repeatable
          Element={MenuLink}
          elements={shopMenu}
          style={{
            container: `mt-8 flex flex-col  items-center justify-start relative `,
            wrapper: ' mr-2 py-[25px] group'
          }}
          pre="headerLink"
        />
        <ul className="mt-12 flex flex-col items-center justify-end capitalize">
          <li className="">
            <div className=" uppercase p-1 hover:underline text-white ">
              <Link href="cart">CART</Link>
            </div>
          </li>
          <li className="flex-1  ">
            <div className=" uppercase p-1 hover:underline text-white ">
              <Link href="login">Log In</Link>
            </div>
          </li>
        </ul>
        <Repeatable
          pre="headerLink"
          style={{
            container: `flex flex-col items-center justify-end capitalize`,
            wrapper: 'flex-1 mt-0'
          }}
          elements={navMenu}
          Element={({ href, label }) => {
            return (
              <div className=" uppercase p-1 hover:underline text-white ">
                <Link href={href}>{label}</Link>
              </div>
            )
          }}
        />
      </div>
    </div>
  )
}

export default MobileMenu
