import CustomLink from '@components/__lib/CustomLink'
import SocialLogo from '@components/__lib/SocialLogo'
import Columns from './columns'

const Footer = ({ footer, locale }) => {
  const label = footer ? footer.label : ''
  const theme = footer && footer.button ? footer.button.theme : {}
  const socialNetworks = footer ? footer.socialNetworks : []

  return (
    // @ts-expect-error TS(2749): 'footer' refers to a value, but is being used as a... Remove this comment to see the full error message
    <footer className="bg-white mt-24 pt-4 pb-8 xl:pt-8">
      {footer && (
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="max-w-screen-lg xl:max-w-screen-xl mx-auto px-4 sm:px-6 md:px-8 text-gray-400 dark:text-gray-300">
          // @ts-expect-error TS(2749): 'Columns' refers to a value, but is being used as ... Remove this comment to see the full error message
          <Columns
            // @ts-expect-error TS(2304): Cannot find name 'columns'.
            columns={footer.footerColumns}
            // @ts-expect-error TS(2362): The left-hand side of an arithmetic operation must... Remove this comment to see the full error message
            locale={locale}
          />
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="pt-8 flex border-t border-gray-200 max-w-xs mx-auto items-center justify-between">
            {socialNetworks &&
              socialNetworks.map((network, index) => (
                // @ts-expect-error TS(2709): Cannot use namespace 'SocialLogo' as a type.
                <SocialLogo
                  // @ts-expect-error TS(2304): Cannot find name 'url'.
                  url={network.url}
                  // @ts-expect-error TS(2304): Cannot find name 'size'.
                  size="20"
                  // @ts-expect-error TS(2304): Cannot find name 'key'.
                  key={index}
                />
              ))}
          </div>

          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="text-center pt-10 sm:pt-12 font-light flex items-center justify-center">
            // @ts-expect-error TS(2552): Cannot find name 'footer'. Did you mean 'Footer'?
            {footer.button && (
              // @ts-expect-error TS(2304): Cannot find name 'button'.
              <button
                // @ts-expect-error TS(2304): Cannot find name 'className'.
                className={`flex-shrink-0 px-4 py-2 text-base font-semibold text-white bg-${theme} rounded-lg shadow-md hover:bg-${theme}-darker focus:outline-none focus:ring-2`}
                // @ts-expect-error TS(2304): Cannot find name 'type'.
                type="submit">
                // @ts-expect-error TS(2709): Cannot use namespace 'CustomLink' as a type.
                <CustomLink {...footer.button.link} />
              </button>
            )}
          </div>
          // @ts-expect-error TS(2304): Cannot find name 'label'.
          {label && (
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="text-center pt-10 sm:pt-12 font-light flex items-center justify-center">
              // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
              {label}
            </div>
          )}
        </div>
      )}
    </footer>
  )
}

Footer.defaultProps = {}

export default Footer
