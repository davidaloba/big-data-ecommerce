import Repeatable from '@app/_global/components/__lib/Repeatable'
import MenuLink from './menulink'

const Menu = ({ links }) => {
  return (
    <>
      <Repeatable
        Element={MenuLink}
        elements={links}
        style={{
          container: `flex flex-row flex-wrap items-center justify-end uppercase`,
          wrapper: 'flex-1 mt-0 '
        }}
        pre="headerLink"
      />
    </>
  )
}

export default Menu
