const OverallRating = ({ reviews }) => {
  const reviewsCount = reviews.length

  if (reviewsCount == 0) {
    return (
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div>
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="shadow-lg rounded-xl w-full p-4 bg-white text-gray-700 text-center relative overflow-hidden">
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="w-full">
            // @ts-expect-error TS(2304): Cannot find name 'p'.
            <p className="text-gray-700 dark:text-white  text-2xl font-light mb-4">
              // @ts-expect-error TS(2304): Cannot find name 'No'.
              No reviews 😥
            // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
            </p>
          </div>
        </div>
      </div>
    )
  }

  // @ts-expect-error TS(2304): Cannot find name 'reviews'.
  const notes = reviews.map((review) => review.attributes.note)
  // @ts-expect-error TS(2304): Cannot find name 'reviewsCount'.
  const average = notes.reduce((a, b) => a + b, 0) / reviewsCount

  const reviewNotes = [
    {
      label: 'Excellent',
      value: notes.filter((note) => note === 5).length
    },
    {
      label: 'Good',
      value: notes.filter((note) => note === 4).length
    },
    {
      label: 'Average',
      value: notes.filter((note) => note === 3).length
    },
    {
      label: 'Bellow Average',
      value: notes.filter((note) => note === 2).length
    },
    {
      label: 'Poor',
      value: notes.filter((note) => note === 1).length
    }
  ]

  return (
    <div>
      <div className="rounded-xl w-full p-4 bg-white text-gray-700 text-center relative overflow-hidden">
        <div className="w-full">
          // @ts-expect-error TS(2304): Cannot find name 'p'.
          <p className="text-gray-700 dark:text-white  text-2xl font-light mb-4">
            // @ts-expect-error TS(2304): Cannot find name 'Overall'.
            Overall Rating
          </p>

          // @ts-expect-error TS(2304): Cannot find name 'reviewsCount'.
          {reviewsCount && (
            // @ts-expect-error TS(2304): Cannot find name 'p'.
            <p className="text-5xl text-black dark:text-white font-bold">
              // @ts-expect-error TS(2362): The left-hand side of an arithmetic operation must... Remove this comment to see the full error message
              {average}/5
            </p>
          )}

          // @ts-expect-error TS(2304): Cannot find name 'reviewsCount'.
          {reviewsCount && <p className="my-4">{reviewsCount} reviews</p>}

          {reviewNotes &&
            reviewNotes.map((item, index) => (
              // @ts-expect-error TS(2304): Cannot find name 'div'.
              <div key={`noteProgress-${index}`}>
                // @ts-expect-error TS(2304): Cannot find name 'div'.
                <div className="flex items-center justify-between text-gray-400 text-sm">
                  // @ts-expect-error TS(2304): Cannot find name 'p'.
                  <p>{item.label}</p>
                  // @ts-expect-error TS(2304): Cannot find name 'p'.
                  <p>{item.value}</p>
                </div>
                // @ts-expect-error TS(2304): Cannot find name 'div'.
                <div className="w-full h-2 bg-gray-100 rounded-full mb-4">
                  // @ts-expect-error TS(2304): Cannot find name 'div'.
                  <div
                    // @ts-expect-error TS(2304): Cannot find name 'className'.
                    className={`${
                      // @ts-expect-error TS(2304): Cannot find name 'item'.
                      item.value === 0
                        ? 'w-0'
                        // @ts-expect-error TS(2304): Cannot find name 'item'.
                        : `w-${item.value}/${reviewsCount}`
                    // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
                    }  h-full text-center text-xs text-white bg-primary rounded-full`}></div>
                </div>
              </div>
            ))}
        // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
        </div>
      </div>
    </div>
  )
}

export default OverallRating
