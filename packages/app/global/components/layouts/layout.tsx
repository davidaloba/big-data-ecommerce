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
    <div>
      // @ts-expect-error TS(2786): 'Seo' cannot be used as a JSX component.
      <Seo seo={pageData.seo} />
      // @ts-expect-error TS(2786): 'PreviewBanner' cannot be used as a JSX component.
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
      // @ts-expect-error TS(2786): 'BlockManager' cannot be used as a JSX component.
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
