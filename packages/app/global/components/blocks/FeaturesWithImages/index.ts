import { getStrapiMedia } from '@utils/index'
import FeaturesCheck from './features-check'

const FeaturesWithImages = ({ header, theme, text, featuresCheck, image }) => {
  const label = header.label
  const title = header.title

  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className="max-w-screen-xl p-4 bg-white mx-auto px-4 sm:px-6 lg:px-8 relative py-40 lg:mt-20">
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="relative">
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="lg:grid lg:grid-flow-row-dense lg:grid-cols-2 lg:gap-8 lg:items-center">
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="lg:col-start-2 md:ml-24 lg:max-w-2xl">
            {label && (
              // @ts-expect-error TS(2304): Cannot find name 'p'.
              <p className={`font-black leading-6 text-${theme} uppercase`}>
                {label}
              </p>
            )}
            // @ts-expect-error TS(2304): Cannot find name 'title'.
            {title && (
              // @ts-expect-error TS(2304): Cannot find name 'h4'.
              <h4 className="mt-2 text-3xl leading-8 font-black text-gray-900 sm:text-4xl sm:leading-9">
                // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                {title}
              </h4>
            )}
            // @ts-expect-error TS(2552): Cannot find name 'text'. Did you mean 'Text'?
            {text && (
              // @ts-expect-error TS(2304): Cannot find name 'p'.
              <p className="mt-4 text-lg leading-6 text-gray-500">{text}</p>
            )}
            // @ts-expect-error TS(2709): Cannot use namespace 'FeaturesCheck' as a type.
            <FeaturesCheck features={featuresCheck} />
          </div>

          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="mt-10 lg:-mx-4 relative relative-20 lg:mt-0 lg:col-start-1">
            // @ts-expect-error TS(2304): Cannot find name 'img'.
            <img
              // @ts-expect-error TS(2304): Cannot find name 'src'.
              src={getStrapiMedia(image.data.attributes.url)}
              // @ts-expect-error TS(2304): Cannot find name 'alt'.
              alt={image.data.attributes.alternativeText}
              // @ts-expect-error TS(2304): Cannot find name 'className'.
              className="relative mx-auto shadow-lg rounded-lg w-auto"
            />
          </div>
        </div>
      </div>
    </div>
  )
}

FeaturesWithImages.defaultProps = {}

export default FeaturesWithImages
