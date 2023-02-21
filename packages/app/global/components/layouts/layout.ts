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
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div>
      // @ts-expect-error TS(2749): 'Seo' refers to a value, but is being used as a ty... Remove this comment to see the full error message
      <Seo seo={pageData.seo} />
      // @ts-expect-error TS(2749): 'PreviewBanner' refers to a value, but is being us... Remove this comment to see the full error message
      {preview && <PreviewBanner />}
      {pageDataIsSuccess && (
        // @ts-expect-error TS(2709): Cannot use namespace 'Navbar' as a type.
        <Navbar
          navigation={navigation}
          // @ts-expect-error TS(2588): Cannot assign to 'pageData' because it is a consta... Remove this comment to see the full error message
          pageData={pageData}
          type={type}
          // @ts-expect-error TS(2304): Cannot find name 'locale'.
          locale={pageData.locale}
        />
      )}
      // @ts-expect-error TS(2304): Cannot find name 'children'.
      {children}
      // @ts-expect-error TS(2552): Cannot find name 'modules'. Did you mean 'module'?
      {modules && (
        // @ts-expect-error TS(2709): Cannot use namespace 'ModuleManager' as a type.
        <ModuleManager
          // @ts-expect-error TS(2552): Cannot find name 'modules'. Did you mean 'module'?
          modules={modules}
          // @ts-expect-error TS(2304): Cannot find name 'locale'.
          locale={pageData.locale}
          // @ts-expect-error TS(2304): Cannot find name 'perPage'.
          perPage={pageData.perPage || 12}
        />
      )}
      // @ts-expect-error TS(2552): Cannot find name 'blocks'. Did you mean 'Lock'?
      {blocks && <BlockManager blocks={blocks} />}
      // @ts-expect-error TS(2304): Cannot find name 'pageDataIsSuccess'.
      {pageDataIsSuccess && (
        // @ts-expect-error TS(2709): Cannot use namespace 'Footer' as a type.
        <Footer
          // @ts-expect-error TS(2304): Cannot find name 'footer'.
          footer={footer}
          // @ts-expect-error TS(2304): Cannot find name 'locale'.
          locale={pageData.locale}
        />
      )}
    </div>
  )
}

export default Layout
