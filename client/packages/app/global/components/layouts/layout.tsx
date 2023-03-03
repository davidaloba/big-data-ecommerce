import Footer from '@components/partials/Footer'
import Navbar from '@components/partials/Navbar'
import PreviewBanner from '@components/partials/PreviewBanner'
import Seo from '@components/partials/seo'
import BlockManager from '@components/blocks/BlockManager'
import ModuleManager from '@modules/ModuleManager'

const Layout = ({ children, global, page, pageDataIsSuccess, type, preview }) => {
  const pageData = page.attributes
  const { navigation, footer } = global.attributes

  const blocks = pageData.blocks || []
  const modules = pageData.main

  return (
    <div className=" mx-auto">
      <Seo seo={pageData.seo} />
      {preview && <PreviewBanner />}
      {pageDataIsSuccess && (
        <Navbar
          navigation={navigation}
          pageData={pageData}
          type={type}
          locale={pageData.locale}
        />
      )}
      {children}
      {modules && (
        <ModuleManager
          modules={modules}
          locale={pageData.locale}
          perPage={pageData.perPage || 12}
        />
      )}
      {blocks && <BlockManager blocks={blocks} />}

      {pageDataIsSuccess && (
        <Footer
          footer={footer}
          locale={pageData.locale}
        />
      )}
    </div>
  )
}

export default Layout
