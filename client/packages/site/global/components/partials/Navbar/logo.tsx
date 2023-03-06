import Link from 'next/link'
import Image from 'next/image'
import { getStrapiMedia } from '@siteUtils/index'

const Logo = ({ url, button }) => {
  return (
    <Link
      href={button.href}
      className="flex font-medium items-center ">
      <Image
        src={getStrapiMedia(url)}
        alt="logo"
        width="40"
        height="40"
      />
      <span className="ml-3 text-2xl font-bold">{button.label}</span>
    </Link>
  )
}

export default Logo
