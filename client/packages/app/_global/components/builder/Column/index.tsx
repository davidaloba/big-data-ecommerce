import Repeatable from '../Repeatable'

const Menu = ({ links, style, link, bgColor, bgImage }) => {
  return (
    <>
      <Repeatable
        Element={Element}
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
