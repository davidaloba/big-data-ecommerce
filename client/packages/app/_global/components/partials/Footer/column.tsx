import Repeatable from '@app/_global/components/__lib/Repeatable'
import CustomLink from '@app/_global/components/__lib/CustomLink'

const Column = ({ links, label, index }) => {
  return (
    <div
      className="flex-col md:w-1/2 lg:w-1/4 uppercase"
      key={`footerColumn-${index}`}>
      <h2 className=" underline">{label}</h2>
      <Repeatable
        Element={CustomLink}
        elements={links}
        style={{
          container: `flex flex-col 
            `,
          wrapper: `mt-3 md:mt-4  
          hover:text-gray-700 `
        }}
        pre="headerLink"></Repeatable>
    </div>
  )
}

export default Column
