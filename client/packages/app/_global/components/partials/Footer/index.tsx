import Repeatable from '@app/_global/components/__lib/Repeatable'
import Column from './column'
import Image from 'next/image'
import Link from 'next/link'

const Footer = ({ label, footerColumns, primaryButton, secondaryButton, socialNetworks }) => {
  return (
    <footer
      id="contact"
      className=" mt-6
      bg-white">
      {primaryButton && (
        <div
          className="
        px-4 py-4
        md:px-24 md:py-6
        lg:px-28 
        text-center
        border-t border-gray-300">
          <Link
            className="hover:font-bold"
            href={primaryButton.link.href}>
            {primaryButton.link.label}
          </Link>
        </div>
      )}
      {footerColumns && (
        <Repeatable
          Element={Column}
          elements={footerColumns}
          style={{
            container: `
              flex flex-wrap flex flex-row items-start  justify-center
              px-4 py-8  
              md:px-24 lg:px-28 md:pt-8
              border-t border-gray-300
            `,
            wrapper: ' mr-2 py-[25px]'
          }}
          pre="headerLink"
        />
      )}
      <div
        className="
        px-4 py-8  
        md:px-24 lg:px-28 md:py-8
        text-center
        border-t border-gray-300">
        <Link
          className="hover:font-bold"
          href="#">
          SUBSCRIBE TO OUR NEWSLETTER
        </Link>
      </div>
      <div
        className="
        px-4 py-8  
        md:px-24 lg:px-28 md:py-8
        text-center
        border-t border-gray-300">
        <Link
          className="text-gray-400"
          href="#">
          ©2023 YINKA SAMUELS INC.
        </Link>
      </div>
    </footer>
  )
}

export default Footer
