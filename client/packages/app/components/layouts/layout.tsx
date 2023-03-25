import Seo from '@appComponents/partials/seo'
import PreviewBanner from '@appComponents/partials/PreviewBanner'
import Navbar from '@appComponents/partials/Navbar'
import Main from '@appComponents/partials/Main'
import Footer from '@appComponents/partials/Footer'

const Layout = ({ children, globalData, pageData, pageDataSuccess, preview }) => {
  const { navigation, footer } = globalData

  return (
    <>
      <Seo seo={pageData.seo} />
      {preview && <PreviewBanner />}
      {pageDataSuccess && (
        <>
          <Navbar navigation={navigation} />
          <Main pageData={pageData}>{children}</Main>
          <Footer footer={footer} />
        </>
      )}
    </>
  )
}

export default Layout
