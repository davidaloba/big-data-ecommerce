import CustomLink from '@components/__lib/CustomLink'

const Columns = ({ columns, locale }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'ul'.
    <ul className="text-lg font-light pb-8 flex flex-wrap justify-center">
      {columns &&
        columns.map((column, index) => (
          // @ts-expect-error TS(2304): Cannot find name 'li'.
          <li
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className="w-1/2 md:w-1/3 lg:w-1/3"
            // @ts-expect-error TS(2304): Cannot find name 'key'.
            key={`footerColumn-${index}`}>
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="text-center">
              // @ts-expect-error TS(2304): Cannot find name 'h2'.
              <h2 className="text-gray-500 text-md font-bold uppercase mb-4">
                // @ts-expect-error TS(2552): Cannot find name 'column'. Did you mean 'Columns'?
                {column.title}
              </h2>
              // @ts-expect-error TS(2304): Cannot find name 'ul'.
              <ul>
                // @ts-expect-error TS(2552): Cannot find name 'column'. Did you mean 'Columns'?
                {column.links &&
                  // @ts-expect-error TS(2552): Cannot find name 'column'. Did you mean 'Columns'?
                  column.links.map((link, index2) => (
                    // @ts-expect-error TS(2304): Cannot find name 'li'.
                    <li
                      // @ts-expect-error TS(2304): Cannot find name 'className'.
                      className="mb-4 hover:text-gray-800 transition-colors duration-200"
                      // @ts-expect-error TS(2304): Cannot find name 'key'.
                      key={`footerColumnLink-${index2}`}>
                      // @ts-expect-error TS(2709): Cannot use namespace 'CustomLink' as a type.
                      <CustomLink
                        // @ts-expect-error TS(2304): Cannot find name 'link'.
                        {...link}
                        // @ts-expect-error TS(2304): Cannot find name 'locale'.
                        locale={locale}
                      />
                    </li>
                  ))}
              // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
              </ul>
            </div>
          </li>
        ))}
    </ul>
  )
}

export default Columns
