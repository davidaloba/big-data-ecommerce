import Repeatable from '@globalComponents/__lib/Repeatable'
import Link from 'next/link'
import Image from 'next/image'
import MenuLink from './menulink'
import { getStrapiMedia } from '@globalUtils/index'

const MegaMenuColumn = ({ image, title, links, style }) => {
  return (
    <>
      {image.data && (
        <Image
          src={getStrapiMedia(image.data.attributes.url)}
          alt="logo"
          width="52"
          height="52"
        />
      )}
      {title && (
        <Link
          className="underline"
          href={title.href}>
          {title.label}
        </Link>
      )}
      {links && (
        <Repeatable
          Element={MenuLink}
          elements={links}
          style={{
            container: ``,
            wrapper: '  capitalize mt-2'
          }}
          pre="headerLink"
        />
      )}
    </>
  )
}

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

const MegaMenu = ({ columns }) => {
  return (
    <Repeatable
      Element={MegaMenuItem}
      elements={columns}
      style={{
        container: `flex flex-row  items-center justify-start relative `,
        wrapper: ' mr-2 py-[25px] group'
      }}
      pre="headerLink"
    />
  )
}

export default MegaMenu
