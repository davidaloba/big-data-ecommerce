const ReviewSummary = ({ reviews }) => {
  // @ts-expect-error TS(2364): The left-hand side of an assignment expression mus... Remove this comment to see the full error message
  return (
    <>
      {reviews && (
        // @ts-expect-error TS(2304): Cannot find name 'span'.
        <span className="text-gray-600 ml-3">{reviews.length} Reviews</span>
      )}
    </>
  )
}

export default ReviewSummary
