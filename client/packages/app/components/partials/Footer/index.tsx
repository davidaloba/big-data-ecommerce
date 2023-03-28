import Repeatable from '@appComponents/__lib/Repeatable'
import Column from './column'
import Image from 'next/image'

const Footer = ({ label, button, socialNetworks, footerColumns }) => {
  return (
    <footer
      id="contact"
      className="px-4 py-8 mt-8 
        md:px-8 lg:px-12 xl:pt-8 
      bg-white">
      <hr className="w-90vw border" />

      <div className="flex flex-row items-start">
        <Image
          className="mr-2 py-[25px]"
          src=" http://localhost:1337/uploads/avatar_e1e3c076c9.png"
          alt="icon"
          width="36"
          height="36"
        />
        {footerColumns && (
          <Repeatable
            Element={Column}
            elements={footerColumns}
            style={{
              container: ` flex flex-wrap
                max-w-screen-lg xl:max-w-screen-xl 
                text-lg font-light text-gray-400 dark:text-gray-300`,
              wrapper: 'text-xs mr-2 py-[25px]'
            }}
            pre="headerLink"
          />
        )}
      </div>
    </footer>
  )
}

export default Footer
