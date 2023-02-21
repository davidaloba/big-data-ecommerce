const Stars = ({ reviews }) => {
  const notes = reviews.map((review) => review.attributes.note)
  const average = Math.floor(notes.reduce((a, b) => a + b, 0) / reviews.length)

  // @ts-expect-error TS(2364): The left-hand side of an assignment expression mus... Remove this comment to see the full error message
  return (
    <>
      {[...Array(5).keys()].map((index) =>
        average <= index ? (
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
            className="w-4 h-4 text-secondary"
            // @ts-expect-error TS(2304): Cannot find name 'viewBox'.
            viewBox="0 0 24 24"
            // @ts-expect-error TS(2304): Cannot find name 'key'.
            key={`reviewStar-${index}`}>
            // @ts-expect-error TS(2304): Cannot find name 'path'.
            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
          </svg>
        ) : (
          // @ts-expect-error TS(2304): Cannot find name 'svg'.
          <svg
            // @ts-expect-error TS(2304): Cannot find name 'fill'.
            fill="currentColor"
            // @ts-expect-error TS(2304): Cannot find name 'stroke'.
            stroke="currentColor"
            // @ts-expect-error TS(2304): Cannot find name 'strokeLinecap'.
            strokeLinecap="round"
            // @ts-expect-error TS(2304): Cannot find name 'strokeLinejoin'.
            strokeLinejoin="round"
            // @ts-expect-error TS(2304): Cannot find name 'strokeWidth'.
            strokeWidth="2"
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className="w-4 h-4 text-secondary"
            // @ts-expect-error TS(2304): Cannot find name 'viewBox'.
            viewBox="0 0 24 24"
            // @ts-expect-error TS(2304): Cannot find name 'key'.
            key={`reviewStar-${index}`}>
            // @ts-expect-error TS(2304): Cannot find name 'path'.
            <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z"></path>
          </svg>
        )
      )}
    </>
  )
}

export default Stars
