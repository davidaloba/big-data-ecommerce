const FeaturesCheck = ({ features }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'ul'.
    <ul className="mt-8 md:grid md:grid-cols-2 gap-6">
      {features &&
        features.map((feature, index) => (
          // @ts-expect-error TS(2304): Cannot find name 'li'.
          <li
            // @ts-expect-error TS(2304): Cannot find name 'key'.
            key={`featureCheck-${index}`}
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className="mt-6 lg:mt-0">
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="flex">
              // @ts-expect-error TS(2304): Cannot find name 'span'.
              <span className="flex-shrink-0 flex items-center justify-center h-6 w-6 rounded-full bg-green-100 text-green-800">
                // @ts-expect-error TS(2304): Cannot find name 'svg'.
                <svg
                  // @ts-expect-error TS(2304): Cannot find name 'className'.
                  className="h-4 w-4"
                  // @ts-expect-error TS(2304): Cannot find name 'viewBox'.
                  viewBox="0 0 20 20"
                  // @ts-expect-error TS(2304): Cannot find name 'fill'.
                  fill="currentColor">
                  // @ts-expect-error TS(2304): Cannot find name 'path'.
                  <path
                    // @ts-expect-error TS(2304): Cannot find name 'fillRule'.
                    fillRule="evenodd"
                    // @ts-expect-error TS(2304): Cannot find name 'd'.
                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                    // @ts-expect-error TS(2304): Cannot find name 'clipRule'.
                    clipRule="evenodd"></path>
                </svg>
              </span>
              // @ts-expect-error TS(2304): Cannot find name 'span'.
              <span className="ml-4 text-base leading-6 font-medium text-gray-500 dark:text-gray-200">
                // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                {feature.text}
              </span>
            </div>
          </li>
        ))}
    </ul>
  )
}

FeaturesCheck.defaultProps = {}

export default FeaturesCheck
