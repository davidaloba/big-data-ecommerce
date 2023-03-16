import Seo from '@siteComponents/partials/seo'
import PreviewBanner from '@siteComponents/partials/PreviewBanner'
import Navbar from '@siteComponents/partials/Navbar'
import Main from '@siteComponents/partials/Main'
import Footer from '@siteComponents/partials/Footer'

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
