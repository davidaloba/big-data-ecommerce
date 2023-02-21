import Cta from './cta'
import LocalSwitch from './localSwitch'
import Logo from './logo'
import Nav from './nav'

const Navigation = ({ navigation, pageData, type, locale }) => {
  return (
    // @ts-expect-error TS(2552): Cannot find name 'header'. Did you mean 'Headers'?
    <header className="text-gray-600 bg-white body-font border-b-2">
      {navigation && (
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
          // @ts-expect-error TS(2749): 'Logo' refers to a value, but is being used as a t... Remove this comment to see the full error message
          <Logo
            // @ts-expect-error TS(2304): Cannot find name 'button'.
            button={navigation.leftButton}
            // @ts-expect-error TS(2362): The left-hand side of an arithmetic operation must... Remove this comment to see the full error message
            locale={locale}
          />

          // @ts-expect-error TS(2749): 'Nav' refers to a value, but is being used as a ty... Remove this comment to see the full error message
          <Nav
            // @ts-expect-error TS(2304): Cannot find name 'links'.
            links={navigation.links}
            // @ts-expect-error TS(2362): The left-hand side of an arithmetic operation must... Remove this comment to see the full error message
            locale={locale}
          />

          {navigation.rightButton && (
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="flex">
              // @ts-expect-error TS(2304): Cannot find name 'div'.
              <div className="mr-5 py-4 px-6 hidden lg:block"></div>
              <Cta
                href={navigation.rightButton.href}
                target={navigation.rightButton.target}
                // @ts-expect-error TS(2362): The left-hand side of an arithmetic operation must... Remove this comment to see the full error message
                label={navigation.rightButton.label}
              />
              // @ts-expect-error TS(2749): 'LocalSwitch' refers to a value, but is being used... Remove this comment to see the full error message
              <LocalSwitch
                pageData={pageData}
                type={type}
                // @ts-expect-error TS(2362): The left-hand side of an arithmetic operation must... Remove this comment to see the full error message
                locale={locale}
              />
            </div>
          )}
        </div>
      )}
    </header>
  )
}

Navigation.defaultProps = {}

export default Navigation
