import PreviewBanner from '@appComponents/partials/PreviewBanner'
import Header from '@appComponents/partials/Header'
import Main from '@appComponents/partials/Main'
import Footer from '@appComponents/partials/Footer'

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
