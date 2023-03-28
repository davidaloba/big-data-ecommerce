import PreviewBanner from '@marketingComponents/partials/PreviewBanner'
import Header from '@marketingComponents/partials/Header'
import Main from '@marketingComponents/partials/Main'
import Footer from '@marketingComponents/partials/Footer'

const Layout = ({ children, globalData, pageData, pageDataSuccess, preview }) => {
  return (
    <>
      {preview && <PreviewBanner />}
      {pageDataSuccess && (
        <>
          <Header {...globalData.header} />
          <Main {...pageData}>{children}</Main>
          <Footer {...globalData.footer} />
        </>
      )}
    </>
  )
}

export default Layout
