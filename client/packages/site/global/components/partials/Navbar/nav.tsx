import Link from 'next/link'

const Nav = ({ links }) => {
  return (
    <nav className="text-xl flex flex-wrap flex-col sm:flex-row justify-around items-center">
      {links.map((link, index) => (
        <Link
          href={link.href}
          key={`navigationLink-${index}`}
          className="mx-1 md:mx-3 text-lg font-bold">
          {link.label}
        </Link>
      ))}
    </nav>
  )
}

export default Nav
