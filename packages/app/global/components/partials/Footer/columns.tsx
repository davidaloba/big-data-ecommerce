import CustomLink from '@components/__lib/CustomLink'
import Image from 'next/image'

const Columns = ({ columns, locale }) => {
  return (
    <div className="text-lg font-light  flex flex-wrap ">
      {columns &&
        columns.map((column, index) => (
          <div
            className="w-1/2 md:w-1/3 lg:w-1/3"
            key={`footerColumn-${index}`}>
            <div className="grid w-max">
              <div className="mr-4 col-start-1 col-end-1 row-start-1 row-end-1 self-center">
                <Image
                  src=" http://localhost:1337/uploads/avatar_e1e3c076c9.png"
                  alt="icon"
                  width="36"
                  height="36"
                />
              </div>
              <h2 className="text-gray-900 text-5xl font-bold col-start-2 row-start-1 row-end-1">
                {column.label}
              </h2>
              <ul className="mt-7 flex md:flex-row flex-col col-start-2 row-start-2">
                {column.links &&
                  column.links.map((link, index2) => (
                    <li
                      className="mb-4 mr-6 text-xl text-gray-900 hover:text-gray-700 font-bold transition-colors duration-200"
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
