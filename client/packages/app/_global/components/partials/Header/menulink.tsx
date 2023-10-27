import Link from 'next/link'

const MenuLink = ({ href, label }) => {
  return (
    <div className=" uppercase p-1 hover:underline border border-white">
      <Link href={`/${href}`}>{label}</Link>
    </div>
  )
}

export default MenuLink
