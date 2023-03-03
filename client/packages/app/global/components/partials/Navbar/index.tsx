import Cta from './cta'
import Logo from './logo'
import Nav from './nav'

const Navigation = ({ navigation, pageData, type }) => {
  //
  return (
    <header className="px-8 text-gray-600 bg-white body-font ">
      {navigation && (
        <div className="px-2 py-4  flex flex-wrap md:flex-row flex-col items-center  justify-between">
          <Logo
            url={navigation.logo.data.attributes.url}
            button={navigation.leftButton}
          />
          <div className="flex flex-wrap md:flex-row flex-col items-center justify-end ">
            <Nav links={navigation.links} />
            {navigation.rightButton && (
              <div className="flex">
                <div className="mr-5 py-4 px-6 hidden lg:block"></div>
                <Cta
                  href={navigation.rightButton.href}
                  target={navigation.rightButton.target}
                  label={navigation.rightButton.label}
                />
              </div>
            )}
          </div>
        </div>
      )}
    </header>
  )
}

Navigation.defaultProps = {}

export default Navigation
