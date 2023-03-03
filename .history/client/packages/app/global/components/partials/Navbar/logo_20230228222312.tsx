import Link from 'next/link'
import Image from 'next/image'
import { getStrapiMedia } from '@utils/index';

const Logo = ({ url, button, locale }) => {
  return (
    <Link
      href={`${button.href}?lang=${locale || 'en'}`}
      className="flex title-font font-medium items-center text-gray-900md:mb-0">
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
