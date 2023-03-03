import CustomLink from '@components/__lib/CustomLink'

const Columns = ({ columns, locale }) => {
  console.log(columns)
  return (
    <div className="text-lg font-light pb-8 flex flex-wrap ">
      {columns &&
        columns.map((column, index) => (
          <div
            className="w-1/2 md:w-1/3 lg:w-1/3"
            key={`footerColumn-${index}`}>
            <div className="">
              <h2 className="text-gray-900 text-4xl font-bold  mb-4">{column.label}</h2>
              <ul className='mt-6 flex md:flex-row flex-col flex-wrap'>
                {column.links &&
                  column.links.map((link, index2) => (
                    <li
                      className="mb-4 mr-4 text-gray-900 hover:text-gray-700 font-bold transition-colors duration-200"
                      key={`footerColumnLink-${index2}`}>
                      <CustomLink
                        {...link}
                        locale={locale}
                      />
                    </li>
                  ))}
              </ul>
            </div>
          </div>
        ))}
    </div>
  )
}

export default Columns
