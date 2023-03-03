import CustomLink from '@components/__lib/CustomLink'

const Columns = ({ columns, locale }) => {
  console.log(columns)
  return (
    <>
    <ul className="text-lg font-light pb-8 flex flex-wrap justify-center">
      {columns &&
        columns.map((column, index) => (
          <li
            className="w-1/2 md:w-1/3 lg:w-1/3"
            key={`footerColumn-${index}`}>
            <div className="text-center">
              <h2 className="text-gray-900 text-md font-bold uppercase mb-4">{column.title}</h2>
              <ul className='flex md:flex-row flex-col flex-wrap '>
                {column.links &&
                  column.links.map((link, index2) => (
                    <li
                      className="m-4 text-gray-900 hover:text-gray-700 font-bold transition-colors duration-200"
                      key={`footerColumnLink-${index2}`}>
                      <CustomLink
                        {...link}
                        locale={locale}
                      />
                    </li>
                  ))}
              </ul>
            </div>
          </li>
        ))}
    </ul>
    </>
  )
}

export default Columns
