import Repeatable from '@appComponents/__lib/Repeatable'
import CustomLink from '@marketingComponents/__lib/CustomLink'
import Image from 'next/image'

const Column = ({ links, label, index }) => {
  return (
    <div
      className="flex-col w-1/2 md:w-1/3 lg:w-1/3"
      key={`footerColumn-${index}`}>
      <h2 className=" text-5xl font-bold col-start-2 row-start-1 row-end-1">{label}</h2>
      <Repeatable
        Element={CustomLink}
        elements={links}
        style={{
          container: `col-start-2 row-start-2 row-end-2
              ml-6 mt-8 flex flex-col 
              md:flex-row row-start-2
            `,
          wrapper: `mb-2 md:mb-3 md:mr-6   hover:text-gray-700 font-bold transition-colors duration-200`
        }}
        pre="headerLink"></Repeatable>
    </div>
  )
}

export default Column
