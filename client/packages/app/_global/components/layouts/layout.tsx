import PreviewBanner from '@app/_global/components/partials/PreviewBanner'
import Header from '@app/_global/components/partials/Header'
import Main from '@app/_global/components/partials/Main'
import Footer from '@app/_global/components/partials/Footer'

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
