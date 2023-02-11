import { HeaderStyle } from '../partials/headerstyle/headerstyle'
import { SidebarStyle } from '../partials/sidebarstyle/sidebarstyle'
import { FooterStyle } from '../partials/footerstyle/footerstyle'

const AppLayout = ({ children }) => {
  return (
    <>
      <div className="wrapper">
        <SidebarStyle />
        <HeaderStyle />
        <div
          className="content-page"
          id="content-page">
          {children}
        </div>
      </div>
      <FooterStyle />
    </>
  )
}

export default AppLayout
