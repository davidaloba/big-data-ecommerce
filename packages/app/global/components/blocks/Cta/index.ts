import Link from 'next/link'

const Cta = ({ title, text, buttons, theme }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className={`bg-${theme}`}>
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="lg:flex lg:items-center lg:justify-between w-2/3 mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8 z-20">
        // @ts-expect-error TS(2304): Cannot find name 'h2'.
        <h2 className="text-3xl font-extrabold text-black sm:text-4xl">
          // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
          {title && <span className="block">{title}</span>}
          // @ts-expect-error TS(2552): Cannot find name 'text'. Did you mean 'Text'?
          {text && <span className="block text-white">{text}</span>}
        </h2>
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="lg:mt-0 lg:flex-shrink-0 space-x-2">
          // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
          {buttons &&
            // @ts-expect-error TS(2304): Cannot find name 'buttons'.
            buttons.map((button, index) => (
              // @ts-expect-error TS(2304): Cannot find name 'div'.
              <div
                // @ts-expect-error TS(2304): Cannot find name 'className'.
                className="mt-4 md:mt-4 inline-flex rounded-md shadow"
                // @ts-expect-error TS(2304): Cannot find name 'key'.
                key={`ctaButton-${index}`}>
                // @ts-expect-error TS(2749): 'Link' refers to a value, but is being used as a t... Remove this comment to see the full error message
                <Link
                  // @ts-expect-error TS(2304): Cannot find name 'href'.
                  href={button.link.href}
                  // @ts-expect-error TS(2304): Cannot find name 'key'.
                  key={`cta-button-${index}`}
                  // @ts-expect-error TS(2304): Cannot find name 'target'.
                  target={button.link.target}>
                  // @ts-expect-error TS(2304): Cannot find name 'button'.
                  <button
                    // @ts-expect-error TS(2304): Cannot find name 'type'.
                    type="button"
                    // @ts-expect-error TS(2304): Cannot find name 'className'.
                    className={`py-4 px-6 bg-${(button, 'theme')} hover:bg-${
                      // @ts-expect-error TS(2304): Cannot find name 'button'.
                      (button, 'theme')
                    // @ts-expect-error TS(2304): Cannot find name 'button'.
                    }-darker focus:ring-${(button, 'theme')}-lighter text-${
                      // @ts-expect-error TS(2304): Cannot find name 'button'.
                      (button, 'theme')
                    // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
                    }-text w-full transition ease-in duration-200 text-center text-base font-semibold shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2  rounded-lg`}>
                    // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                    {button.link.label}
                  </button>
                </Link>
              </div>
            ))}
        // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
        </div>
      </div>
    </div>
  )
}

Cta.defaultProps = {}

export default Cta
