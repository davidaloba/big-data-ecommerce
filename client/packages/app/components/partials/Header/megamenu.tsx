import Repeatable from '@appComponents/__lib/Repeatable'
import MegaMenuItem from './megamenu-item'

const MegaMenu = ({ columns }) => {
  return (
    <Repeatable
      Element={MegaMenuItem}
      elements={columns}
      style={{
        container: 'md:flex md:flex-row items-center justify-start relative ',
        wrapper: 'text-xs mr-2 py-6 group'
      }}
      pre="headerLink"
    />
  )
}

export default MegaMenu
