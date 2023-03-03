import Link from 'next/link'
import Image from 'next/image'
import { getStrapiMedia } from '@utils/index';

const Logo = ({ url, button, locale }) => {
  console.log(getStrapiMedia(url));
  return (
    <Link
      href={`${button.href}?lang=${locale || 'en'}`}
      className="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
      <Image
        src={url}
        alt="logo"
        width="36"
        height="36"
      />
      <span className="ml-3 text-3xl">{button.label}</span>
    </Link>
  )
}

export default Logo
