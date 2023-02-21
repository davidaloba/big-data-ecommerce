const OpeningHours = ({ opening_hours }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className="flex relative pb-12">
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="flex-shrink-0 w-10 h-10 rounded-full bg-secondary inline-flex items-center justify-center text-white relative z-10">
        // @ts-expect-error TS(2304): Cannot find name 'svg'.
        <svg
          // @ts-expect-error TS(2304): Cannot find name 'fill'.
          fill="none"
          // @ts-expect-error TS(2304): Cannot find name 'stroke'.
          stroke="currentColor"
          // @ts-expect-error TS(2304): Cannot find name 'strokeLinecap'.
          strokeLinecap="round"
          // @ts-expect-error TS(2304): Cannot find name 'strokeLinejoin'.
          strokeLinejoin="round"
          // @ts-expect-error TS(2304): Cannot find name 'strokeWidth'.
          strokeWidth="2"
          // @ts-expect-error TS(2304): Cannot find name 'className'.
          className="w-5 h-5"
          // @ts-expect-error TS(2304): Cannot find name 'viewBox'.
          viewBox="0 0 24 24">
          // @ts-expect-error TS(2304): Cannot find name 'path'.
          <path
            // @ts-expect-error TS(2304): Cannot find name 'strokeLinecap'.
            strokeLinecap="round"
            // @ts-expect-error TS(2304): Cannot find name 'strokeLinejoin'.
            strokeLinejoin="round"
            // @ts-expect-error TS(2304): Cannot find name 'strokeWidth'.
            strokeWidth="2"
            // @ts-expect-error TS(2304): Cannot find name 'd'.
            d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
          />
        </svg>
      </div>
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="flex-grow pl-4">
        // @ts-expect-error TS(2304): Cannot find name 'h2'.
        <h2 className="font-bold title-font text-sm text-gray-900 mb-1 tracking-wider">
          // @ts-expect-error TS(2304): Cannot find name 'Opening'.
          Opening hours
        </h2>
        // @ts-expect-error TS(2304): Cannot find name 'ul'.
        <ul>
          {opening_hours &&
            opening_hours.map((item, index) => (
              // @ts-expect-error TS(2304): Cannot find name 'li'.
              <li
                // @ts-expect-error TS(2304): Cannot find name 'className'.
                className="flex items-center text-gray-600 dark:text-gray-200 justify-between py-3 border-b-2 border-gray-100 dark:border-gray-800"
                // @ts-expect-error TS(2304): Cannot find name 'key'.
                key={`openingHour-${index}`}>
                // @ts-expect-error TS(2304): Cannot find name 'div'.
                <div className="flex items-center justify-start text-sm">
                  // @ts-expect-error TS(2304): Cannot find name 'span'.
                  <span className="mx-2">
                    // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                    {item.day_interval} {item.opening_hour} -{' '}
                    // @ts-expect-error TS(2304): Cannot find name 'item'.
                    {item.closing_hour}
                  // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
                  </span>
                </div>
              </li>
            ))}
        // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
        </ul>
      </div>
    </div>
  )
}

export default OpeningHours
