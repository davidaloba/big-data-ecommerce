import Link from 'next/link'
import Image from 'next/image'
import { getStrapiMedia } from 'packages/global/utils/index'

const Logo = ({ url, button }) => {
  return (
    <Link
      href={button.href}
      className="flex font-medium items-center ">
      <Image
        src={getStrapiMedia(url)}
        alt="logo"
        width="52"
        height="52"
      />
      {/* <span className="ml-1 text-xl md:text-3xl font-bold">{button.label}</span> */}
    </Link>
  )
}

export default Logo
