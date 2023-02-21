import CustomLink from '../../__lib/CustomLink'
import ImageCards from './image-cards'

const Hero = ({ images, header, text, buttons }) => {
  const title = header.title

  return (
    // @ts-expect-error TS(2304): Cannot find name 'section'.
    <section className="text-gray-600 body-font py-40 flex justify-center items-center 2xl:h-screen">
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="container flex md:flex-row flex-col items-center">
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="mt-4 relative relative-20 lg:mt-0 lg:col-start-1">
          // @ts-expect-error TS(2709): Cannot use namespace 'ImageCards' as a type.
          <ImageCards images={images} />
        </div>

        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="lg:flex-grow md:w-1/2 my-12 lg:pl-24 md:pl-16 md:mx-auto flex flex-col md:items-start md:text-left items-center text-center">
          {title && (
            // @ts-expect-error TS(2304): Cannot find name 'h1'.
            <h1 className="title-font lg:text-6xl text-5xl mb-4 font-black text-gray-900">
              {title}
            </h1>
          )}

          // @ts-expect-error TS(2552): Cannot find name 'text'. Did you mean 'Text'?
          {text && <p className="mb-8 px-2 leading-relaxed">{text}</p>}

          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="block space-y-3 md:flex md:space-y-0 space-x-2">
            // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
            {buttons &&
              // @ts-expect-error TS(2304): Cannot find name 'buttons'.
              buttons.map((button, index) => (
                // @ts-expect-error TS(2749): 'button' refers to a value, but is being used as a... Remove this comment to see the full error message
                <button
                  // @ts-expect-error TS(2304): Cannot find name 'key'.
                  key={`heroButton-${index}`}
                  // @ts-expect-error TS(2304): Cannot find name 'className'.
                  className={`inline-block text-${(button, 'theme')}-text bg-${
                    // @ts-expect-error TS(2304): Cannot find name 'button'.
                    (button, 'theme')
                  } border-0 py-2 px-6 focus:outline-none hover:bg-${
                    // @ts-expect-error TS(2304): Cannot find name 'button'.
                    (button, 'theme')
                  }-darker rounded-full shadow-md hover:shadow-md text-lg`}>
                  // @ts-expect-error TS(2709): Cannot use namespace 'CustomLink' as a type.
                  <CustomLink {...button.link} />
                </button>
              ))}
          // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
          </div>
        </div>
      </div>
    </section>
  )
}

Hero.defaultProps = {}

export default Hero
