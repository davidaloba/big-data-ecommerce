import PreviewBanner from '@globalComponents/partials/PreviewBanner'
import Header from '@globalComponents/partials/Header'
import Main from '@globalComponents/partials/Main'
import Footer from '@globalComponents/partials/Footer'

const Layout = ({ children, globalData: { header, footer }, preview }) => {
  return (
    <>
      {preview && <PreviewBanner />}
      {header && <Header {...header} />}
      {children && <Main>{children}</Main>}
      {footer && <Footer {...footer} />}
    </>
  )
}

export default Layout
