import { getStrapiMedia } from '@utils/index'

const Cards = ({ cards }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className="sm:flex flex-wrap justify-center text-center gap-8 pt-24 pb-40 items-stretch">
      {cards &&
        cards.map((item, index) => (
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className={`w-full sm:w-1/2 md:w-1/2 lg:w-1/4 px-4 py-4 bg-white mt-6 shadow-lg rounded-lg`}
            // @ts-expect-error TS(2304): Cannot find name 'key'.
            key={`feature-${index}`}>
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="flex-shrink-0">
              // @ts-expect-error TS(2304): Cannot find name 'div'.
              <div className="flex items-center mx-auto justify-center h-24 w-24 rounded-md">
                // @ts-expect-error TS(2304): Cannot find name 'img'.
                <img
                  // @ts-expect-error TS(2304): Cannot find name 'src'.
                  src={getStrapiMedia(item.image.data.attributes.url)}
                  // @ts-expect-error TS(2304): Cannot find name 'alt'.
                  alt={item.image.data.attributes.alternativeText}
                />
              </div>
            </div>
            // @ts-expect-error TS(2304): Cannot find name 'h3'.
            <h3 className="text-2xl sm:text-xl text-gray-700 font-semibold py-4">
              // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
              {item.title}
            </h3>

            // @ts-expect-error TS(2304): Cannot find name 'p'.
            <p className="text-md  text-gray-500 py-4">{item.text}</p>
          </div>
        ))}
    </div>
  )
}

Cards.defaultProps = {}

export default Cards
