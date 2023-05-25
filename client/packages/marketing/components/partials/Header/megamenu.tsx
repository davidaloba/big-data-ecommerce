import Repeatable from '@marketingComponents/__lib/Repeatable'
import MegaMenuItem from './megamenu-item'

const MegaMenu = ({ columns }) => {
  return (
    <Repeatable
      Element={MegaMenuItem}
      elements={columns}
      style={{
        container: `hidden md:flex flex-row items-center justify-start relative `,
        wrapper: ' mr-2 py-[25px] group'
      }}
      pre="headerLink"
    />
  )
}

export default MegaMenu
