import { HeaderStyle } from '../partials/headerstyle/headerstyle'
import { SidebarStyle } from '../partials/sidebarstyle/sidebarstyle'
import { FooterStyle } from '../partials/footerstyle/footerstyle'

import AppRoute from '../routes/approute'

const AppLayout = () => {
  return (
    <>
      <div className="wrapper">
        <SidebarStyle />
        <HeaderStyle />
        <div
          className="content-page"
          id="content-page">
          <AppRoute />
        </div>
      </div>
      <FooterStyle />
    </>
  )
}

export default AppLayout
