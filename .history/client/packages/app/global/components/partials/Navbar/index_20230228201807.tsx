import Cta from './cta'
import LocalSwitch from './localSwitch'
import Logo from './logo'
import Nav from './nav'
import Image from 'next/image'

const Navigation = ({ navigation, pageData, type, locale }) => {
  return (
    <header className="text-gray-600 bg-white body-font border-b-2">
      {navigation && (
        <div className="container mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
        <Image src='@assets/images/logo.png'  />
          <Logo
            button={navigation.leftButton}
            locale={locale}
          />

          <Nav
            links={navigation.links}
            locale={locale}
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
