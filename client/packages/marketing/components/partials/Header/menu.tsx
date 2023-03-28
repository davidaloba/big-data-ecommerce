import Link from 'next/link'
import Repeatable from '@appComponents/__lib/Repeatable'

const Menu = ({ links, style }: { links: []; style?: string }) => {
  return (
    <Repeatable
      elements={links}
      Element={(props) => <Link href={props.element.href}>{props.element.label}</Link>}
      style={{
        container: ` ${style} text-xs capitalize`,
        wrapper: 'mt-2 md:mt-0 mx-1 md:mx-2 '
      }}
      pre="headerLink"
    />
  )
}

export default Menu
