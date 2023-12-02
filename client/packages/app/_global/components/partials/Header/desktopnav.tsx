'use client'
import { usePathname } from 'next/navigation'
import dynamic from 'next/dynamic'

import { getStrapiMedia } from '@app/_global/utils/index'

import Image from 'next/image'
import Link from 'next/link'
import MegaMenu from './megamenu'
// import ShopMenu from './shopmenu'

const ShopMenu = dynamic(() => import('./shopmenu'), { ssr: false })

const DesktopNav = ({ navMenu, shopMenu, logo, logoWidth, cartCount }) => {
  const pathname = usePathname()

  return pathname === '/checkout' ? (
    <nav
      className="hidden px-4 md:px-6 lg:px-8 2xl:px-12 py-2
    md:flex flex-row items-center justify-between bg-white uppercase">
      <div className="flex-1"></div>
      <Link href="/">
        <Image
          src={logo && logo.data ? getStrapiMedia(logo.data.attributes.url) : `/avatar.png`}
          alt="logo"
          width={logoWidth || '44'}
          height="44"
        />
      </Link>
      <div className="flex flex-row flex-1 justify-end"></div>
    </nav>
  ) : (
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
        <ShopMenu
          navMenu={navMenu}
          cartCount={cartCount}
        />
      </div>
    </nav>
  )
}

export default DesktopNav
