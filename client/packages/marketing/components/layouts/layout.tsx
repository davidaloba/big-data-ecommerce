import PreviewBanner from '@marketingComponents/partials/PreviewBanner'
import Header from '@marketingComponents/partials/Header'
import Main from '@marketingComponents/partials/Main'
import Footer from '@marketingComponents/partials/Footer'

const Layout = ({ children, globalData, preview }) => {
  return (
    <>
      {preview && <PreviewBanner />}
      <Header {...globalData.header} />
      <Main>{children}</Main>
      <Footer {...globalData.footer} />
    </>
  )
}

export default Layout
