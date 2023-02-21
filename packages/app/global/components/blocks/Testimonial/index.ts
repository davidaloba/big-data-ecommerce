import { getStrapiMedia } from '@utils/index'

const Testimonial = ({ theme, text, author }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className="bg-white pt-60 pb-60 px-4">
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="bg-gray-600 md:w-3/4 mx-auto p-20 rounded-full">
        {text && (
          // @ts-expect-error TS(2304): Cannot find name 'p'.
          <p className="text-white w-full md:w-2/3 m-auto text-center text-md md:text-3xl">
            // @ts-expect-error TS(2304): Cannot find name 'span'.
            <span className={`font-bold text-${theme}`}>“</span>
            {text}
            // @ts-expect-error TS(2304): Cannot find name 'span'.
            <span className={`font-bold text-${theme}`}>”</span>
          </p>
        )}

        // @ts-expect-error TS(2304): Cannot find name 'author'.
        {author && (
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="flex items-center justify-center mt-8">
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="block relative">
              // @ts-expect-error TS(2304): Cannot find name 'img'.
              <img
                // @ts-expect-error TS(2304): Cannot find name 'alt'.
                alt={
                  // @ts-expect-error TS(2304): Cannot find name 'author'.
                  (author,
                  'data.attributes.picture.data.attributes.alternativeText')
                }
                // @ts-expect-error TS(2304): Cannot find name 'src'.
                src={getStrapiMedia(
                  author.data.attributes.picture.data.attributes.url
                )}
                // @ts-expect-error TS(2304): Cannot find name 'className'.
                className="mx-auto object-cover rounded-full h-10 w-10 "
              />
            </div>

            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="flex ml-2 items-center justify-center">
              // @ts-expect-error TS(2304): Cannot find name 'span'.
              <span
                // @ts-expect-error TS(2304): Cannot find name 'className'.
                className={`font-semibold text-${theme} mr-2 text-md md:text-lg`}>
                // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                {author.data.attributes.username}
              </span>
              // @ts-expect-error TS(2304): Cannot find name 'span'.
              <span className="text-gray-400 text-xs md:text-xl font-light">
                /
              </span>
              // @ts-expect-error TS(2304): Cannot find name 'span'.
              <span className="text-gray-400 text-xs md:text-lg ml-2">
                // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                {author.data.attributes.job}
              </span>
            </div>
          </div>
        )}
      </div>
    </div>
  )
}

Testimonial.defaultProps = {}

export default Testimonial
