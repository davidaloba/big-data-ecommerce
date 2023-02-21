import Link from 'next/link'

const Nav = ({ links, locale }) => {
  return (
    <nav className="text-xl mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
      {links.map((link, index) => (
        <Link
          href={`${link.href}?lang=${locale || 'en'}`}
          key={`navigationLink-${index}`}
          className="md:mr-10 hover:text-gray-900">
          {link.label}
        </Link>
      ))}
    </nav>
  )
}

export default Nav
