import Footer from '@components/partials/Footer'
import Navbar from '@components/partials/Navbar'
import PreviewBanner from '@components/partials/PreviewBanner'
import Seo from '@components/partials/seo'
import BlockManager from '@components/blocks/BlockManager'
import ModuleManager from '@modules/ModuleManager'

const Layout = ({ children, global, pageData, type, preview }) => {
  const blocks = pageData.attributes.blocks
  const modules = pageData.attributes.main

  return (
    <div>
      <Seo seo={pageData.attributes.seo} />
      {preview && <PreviewBanner />}
      <Navbar
        {...global}
        pageData={pageData}
        type={type}
      />
      {children}
      {modules && <ModuleManager modules={modules} />}
      {blocks && <BlockManager blocks={blocks} />}
      <Footer
        {...global}
        pageData={pageData}
      />
    </div>
  )
}

export default Layout
