import Link from 'next/link'
import Repeatable from '@marketingComponents/__lib/Repeatable'
import MenuLink from './menulink'

const Menu = ({ links }) => {
  return (
    <Repeatable
      Element={MenuLink}
      elements={links}
      style={{
        container: `flex flex-row flex-wrap items-center justify-end  capitalize
        min-w-[40vw] `,
        wrapper: 'mt-2 md:mt-0 mx-1 md:mx-2 '
      }}
      pre="headerLink"
    />
  )
}

export default Menu
