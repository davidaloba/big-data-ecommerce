import Columns from './columns'

const Footer = ({ label, button, socialNetworks, footerColumns }) => {
  return (
    <footer
      id="contact"
      className="bg-white mt-8 xl:pt-8">
      {footerColumns && (
        <div className="max-w-screen-lg xl:max-w-screen-xl  px-4 sm:px-6 md:px-8 text-gray-400 dark:text-gray-300">
          <Columns columns={footerColumns} />
        </div>
      )}
    </footer>
  )
}

export default Footer
