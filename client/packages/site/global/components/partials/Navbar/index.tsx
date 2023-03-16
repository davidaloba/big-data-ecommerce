import { useState } from 'react'
import Cta from './cta'
import Logo from './logo'
import Nav from './nav'

const Navigation = ({ navigation }) => {
  //
  const [mobileMenu, setMobileMenu] = useState(false)

  return (
    <header className=" sticky top-0 z-50 ">
      <div
        className="md:px-12 px-8
       bg-gray-50 ">
        {navigation && (
          <div
            className=" px-2 py-4 
            flex flex-wrap flex-row items-center  justify-between">
            <Logo
              url={navigation.logo.data.attributes.url}
              button={navigation.leftButton}
            />
            <div
              className="md:flex md:flex-row flex-wrap items-center justify-end
            hidden">
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
            <div
              className=" py-1 px-4 text-sm
              md:hidden
              font-semibold 
              cursor-pointer shadow rounded-lg bg-white "
              onClick={() => setMobileMenu(!mobileMenu)}>
              Menu
            </div>
          </div>
        )}
      </div>
      <div
        id="mobile-menu"
        className={`md:hidden fixed w-[90vw] h-auto left-[5vw] top-20 py-4
        ${!mobileMenu && 'hidden h-0'} 
        shadow-xl rounded-lg bg-gray-50 
        transition-all duration-[30000ms] `}>
        <div
          className="w-min-content"
          onClick={() => setMobileMenu(false)}>
          <Nav links={navigation.links} />
        </div>
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
    </header>
  )
}

Navigation.defaultProps = {}

export default Navigation
