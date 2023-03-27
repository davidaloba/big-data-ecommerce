import Link from 'next/link'

const Nav = ({ style, links }) => {
  return (
    <ul className={` ${style} text-xs capitalize`}>
      {links.map((link, index) => (
        <li
          key={`navigationLink-${index}`}
          className="mt-2 md:mt-0 mx-1 md:mx-2 ">
          <Link href={link.href}>{link.label}</Link>
        </li>
      ))}
    </ul>
  )
}

export default Nav
