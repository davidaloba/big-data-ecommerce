import Link from 'next/link'

const MenuLink = ({ href, label }) => {
  return (
    <div className="px-2 py-1 hover:underline border border-white">
      <Link href={href}>{label}</Link>
    </div>
  )
}

export default MenuLink
