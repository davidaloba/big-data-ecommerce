import Seo from '@marketingComponents/partials/seo'
import PreviewBanner from '@marketingComponents/partials/PreviewBanner'
import Navbar from '@marketingComponents/partials/Navbar'
import Main from '@marketingComponents/partials/Main'
import Footer from '@marketingComponents/partials/Footer'

const Layout = ({ children, globalData, pageData, pageDataSuccess, preview }) => {
  const { navigation, footer } = globalData
  const blocks = pageData.blocks || []
  const modules = pageData.main

  return (
    <>
      <Seo seo={pageData.seo} />
      {preview && <PreviewBanner />}
      {pageDataSuccess && (
        <>
          <Navbar navigation={navigation} />
          <Main
            blocks={blocks}
            modules={modules}
            perPage={pageData.perPage}>
            {children}
          </Main>
          <Footer footer={footer} />
        </>
      )}
    </>
  )
}

export default Layout
