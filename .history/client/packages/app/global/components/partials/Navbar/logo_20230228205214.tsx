import Link from 'next/link'
import Image from 'next/image'

const Logo = ({ url, button, locale }) => {
  return (
    <Link
      href={`${button.href}?lang=${locale || 'en'}`}
      className="flex title-font font-medium items-center text-gray-900 mb-4 md:mb-0">
      <Image
        src="/client/packages/app/global/assets/images/logo.png"
        alt="logo"
        width="120"
        height="60"
      />
      <span className="ml-3 text-3xl">{button.label}</span>
    </Link>
  )
}

export default Logo
