import Menu from './menu'

const MobileNav = ({ navMenu, mobileMenu, setMobileMenu }) => {
  return (
    <nav
      id="mobile-menu"
      className={`md:hidden fixed w-[90vw] h-auto left-[5vw] top-20 py-4
    ${!mobileMenu && 'hidden h-0'} 
    shadow-xl rounded-lg bg-gray-50 
    transition-all duration-[30000ms] `}>
      <div
        className="w-min-content"
        onClick={() => setMobileMenu(false)}>
        <Menu links={navMenu} />
      </div>
    </nav>
  )
}

export default MobileNav
