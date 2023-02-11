import Footer from '@components/partials/Footer'
import Navbar from '@components/partials/Navbar'
import PreviewBanner from '@components/partials/PreviewBanner'
import Seo from '@components/partials/seo'

const Layout = ({ children, global, pageData, preview, type }) => {
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
      <Footer
        {...global}
        pageData={pageData}
      />
    </div>
  )
}

export default Layout
