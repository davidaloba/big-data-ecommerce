import Cta from './cta'
import LocalSwitch from './localSwitch'
import Logo from './logo'
import Nav from './nav'

const Navigation = ({ navigation, pageData, type }) => {
  return (
    <header className="text-gray-600 bg-white body-font border-b-2">
      <div className="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
        <Logo
          button={navigation.leftButton}
          locale={pageData.attributes.locale}
        />

        <Nav
          links={navigation.links}
          locale={pageData.attributes.locale}
        />

        {navigation.rightButton && (
          <div className="flex">
            <div className="mr-5 py-4 px-6 hidden lg:block"></div>
            <Cta
              href={navigation.rightButton.href}
              target={navigation.rightButton.target}
              label={navigation.rightButton.label}
            />
            <LocalSwitch
              pageData={pageData}
              type={type}
            />
          </div>
        )}
      </div>
    </header>
  )
}

Navigation.defaultProps = {}

export default Navigation
