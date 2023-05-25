import Repeatable from '@globalComponents/__lib/Repeatable'
import MenuLink from './menulink'

const Menu = ({ links }) => {
  return (
    <>
      <Repeatable
        Element={MenuLink}
        elements={links}
        style={{
          container: `flex flex-row flex-wrap items-center justify-end  capitalize`,
          wrapper: 'flex-1 mt-2 md:mt-0   '
        }}
        pre="headerLink"
      />
    </>
  )
}

export default Menu
