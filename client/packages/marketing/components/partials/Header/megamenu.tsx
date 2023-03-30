import Repeatable from '@appComponents/__lib/Repeatable'
import MegaMenuItem from './megamenu-item'

const MegaMenu = ({ columns }) => {
  return (
    <Repeatable
      Element={MegaMenuItem}
      elements={columns}
      style={{
        container: `flex flex-row  items-center justify-start relative 
        min-w-[40vw]`,
        wrapper: ' mr-2 py-[25px] group'
      }}
      pre="headerLink"
    />
  )
}

export default MegaMenu
