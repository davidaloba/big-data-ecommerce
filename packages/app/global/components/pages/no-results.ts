const NoResults = ({ status, length }) => {
  if (status == 'error' || length == 0) {
    return (
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="shadow-lg rounded-2xl p-4 bg-white dark:bg-gray-800 w-64 m-auto">
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="w-full h-full text-center">
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="flex h-full flex-col justify-between">
            // @ts-expect-error TS(2304): Cannot find name 'svg'.
            <svg
              // @ts-expect-error TS(2304): Cannot find name 'xmlns'.
              xmlns="http://www.w3.org/2000/svg"
              // @ts-expect-error TS(2304): Cannot find name 'className'.
              className="h-12 w-12 text-primary m-auto"
              // @ts-expect-error TS(2304): Cannot find name 'fill'.
              fill="none"
              // @ts-expect-error TS(2304): Cannot find name 'viewBox'.
              viewBox="0 0 24 24"
              // @ts-expect-error TS(2304): Cannot find name 'stroke'.
              stroke="currentColor">
              // @ts-expect-error TS(2304): Cannot find name 'path'.
              <path
                // @ts-expect-error TS(2304): Cannot find name 'strokeLinecap'.
                strokeLinecap="round"
                // @ts-expect-error TS(2304): Cannot find name 'strokeLinejoin'.
                strokeLinejoin="round"
                // @ts-expect-error TS(2304): Cannot find name 'strokeWidth'.
                strokeWidth="2"
                // @ts-expect-error TS(2304): Cannot find name 'd'.
                d="M9.172 16.172a4 4 0 015.656 0M9 10h.01M15 10h.01M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
              />
            </svg>
            // @ts-expect-error TS(2304): Cannot find name 'p'.
            <p className="text-gray-800 dark:text-gray-200 text-xl font-bold mt-4">
              {status == 'error'
                ? 'Error'
                : `We couldn't find what you're looking for`}
            // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
            </p>
          </div>
        </div>
      </div>
    )
  }
  return <></>
}

export default NoResults
