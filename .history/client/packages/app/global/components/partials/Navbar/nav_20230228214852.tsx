import Link from 'next/link'

const Nav = ({ links, locale }) => {
  return (
    <nav className="text-xl flex flex-wrap p-5 flex-col md:flex-row items-center justify-around">
      {links.map((link, index) => (
        <Link
          href={`${link.href}?lang=${locale || 'en'}`}
          key={`navigationLink-${index}`}
          className="md:mr-10 text-gray-900 hover:text-gray-600 text-lg font-bold">
          {link.label}
        </Link>
      ))}
    </nav>
  )
}

export default Nav
