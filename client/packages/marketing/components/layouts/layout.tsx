import PreviewBanner from '@marketingComponents/partials/PreviewBanner'
import Header from '@marketingComponents/partials/Header'
import Main from '@marketingComponents/partials/Main'
import Footer from '@marketingComponents/partials/Footer'

const Layout = ({ children, globalData:{header, footer}, preview }) => {
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
