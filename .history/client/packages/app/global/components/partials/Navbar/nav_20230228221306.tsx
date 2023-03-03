import Link from 'next/link'
import LocalSwitch from './localSwitch'

const Nav = ({ links, locale, pageData, type }) => {
  return (
    <nav className="text-xl flex flex-wrap p-5 flex-col md:flex-row justify-around items-center">
      {links.map((link, index) => (
        <Link
          href={`${link.href}?lang=${locale || 'en'}`}
          key={`navigationLink-${index}`}
          className="md:mx-5 text-gray-900 hover:text-gray-600 text-lg font-bold">
          {link.label}
        </Link>
      ))}

      <LocalSwitch
                pageData={pageData}
                type={type}
                locale={locale}
                />
    </nav>
  )
}

export default Nav
