import Footer from '@siteComponents/partials/Footer'
import Navbar from '@siteComponents/partials/Navbar'
import PreviewBanner from '@siteComponents/partials/PreviewBanner'
import Seo from '@siteComponents/partials/seo'
import BlockManager from '@siteComponents/blocks/BlockManager'
import ModuleManager from '@siteModules/ModuleManager'

const Layout = ({ children, globalData, pageData, pageDataIsSuccess, preview }) => {
  const { navigation, footer } = globalData
  const blocks = pageData.blocks || []
  const modules = pageData.main

  return (
    <div className=" mx-auto">
      <Seo seo={pageData.seo} />
      {preview && <PreviewBanner />}
      {pageDataIsSuccess && <Navbar navigation={navigation} />}
      <main>
        {children}
        {modules && (
          <ModuleManager
            modules={modules}
            perPage={pageData.perPage || 12}
          />
        )}
        {blocks && <BlockManager blocks={blocks} />}
      </main>
      {pageDataIsSuccess && <Footer footer={footer} />}
    </div>
  )
}

export default Layout
