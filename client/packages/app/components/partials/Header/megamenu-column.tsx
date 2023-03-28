import Image from 'next/image'
import MenuLink from './menulink'
import Repeatable from '@appComponents/__lib/Repeatable'

import { getStrapiMedia } from '@globalUtils/index'
import Link from 'next/link'

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
            wrapper: ' text-xs capitalize mt-2'
          }}
          pre="headerLink"
        />
      )}
    </>
  )
}

export default MegaMenuColumn
