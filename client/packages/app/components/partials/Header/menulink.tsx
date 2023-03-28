import Link from 'next/link'

const MenuLink = ({ href, label }) => {
  return <Link href={href}>{label}</Link>
}

export default MenuLink
