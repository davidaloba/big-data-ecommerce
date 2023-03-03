import Link from 'next/link'

const Nav = ({ links, locale }) => {
  return (
    <nav className="text-xl flex flex-wrap pt-3 flex-col md:flex-row justify-around items-center">
      {links.map((link, index) => (
        <Link
          href={`${link.href}?lang=${locale || 'en'}`}
          key={`navigationLink-${index}`}
          className="md:mx-5 text-gray-900 hover:text-gray-600 text-lg font-bold">
          {link.label}
        </Link>
      ))}
    </nav>
  )
}

export default Nav
