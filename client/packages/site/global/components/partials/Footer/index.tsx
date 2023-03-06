import CustomLink from '@siteComponents/__lib/CustomLink'
import SocialLogo from '@siteComponents/__lib/SocialLogo'
import Columns from './columns'

const Footer = ({ footer }) => {
  const label = footer ? footer.label : ''
  const theme = footer && footer.button ? footer.button.theme : {}
  const socialNetworks = footer ? footer.socialNetworks : []

  return (
    <footer className="bg-white mt-8 xl:pt-8">
      {footer && (
        <div className="max-w-screen-lg xl:max-w-screen-xl  px-4 sm:px-6 md:px-8 text-gray-400 dark:text-gray-300">
          <Columns columns={footer.footerColumns} />
        </div>
      )}
    </footer>
  )
}

Footer.defaultProps = {}

export default Footer
