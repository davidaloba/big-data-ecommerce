import Link from 'next/link'
import Repeatable from '@marketingComponents/__lib/Repeatable'
import MegaMenuColumn from './megamenu-column'

const MegaMenuItem = ({ menu, columns }) => {
  return (
    <>
      {menu && (
        <Link
          className="pr-2"
          href={menu.href}>
          {menu.label}
        </Link>
      )}
      {columns && (
        <div
          className="
            hidden group-hover:block hover:block 
            fixed left-0 top-[64px] -z-10 
            md:w-full h-max pb-8
          bg-white">
          <Repeatable
            Element={MegaMenuColumn}
            elements={columns}
            style={{
              container: `
                hidden group-hover:flex hover:flex justify-start items-start
                pt-16 pb-8 px-12`,
              wrapper: `mr-8 relative`
            }}
            pre="mmItem"
          />
        </div>
      )}
    </>
  )
}

export default MegaMenuItem
