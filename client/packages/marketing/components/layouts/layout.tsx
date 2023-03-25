import Seo from '@marketingComponents/partials/seo'
import PreviewBanner from '@marketingComponents/partials/PreviewBanner'
import Navbar from '@marketingComponents/partials/Navbar'
import Main from '@marketingComponents/partials/Main'
import Footer from '@marketingComponents/partials/Footer'

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
