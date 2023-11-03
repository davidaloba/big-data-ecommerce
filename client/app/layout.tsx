import { Metadata } from 'next'
import { getStrapiURL } from '@globalUtils/index'
import { fetchData } from '@globalUtils/actions'
import { ReduxProvider } from '@globalStore/providers'

import 'tailwindcss/tailwind.css'
import '@globalStyles/global.css'
import Layout from '@globalComponents/layouts/layout'

export default async function RootLayout({ children }: { children: React.ReactNode }) {
  const global = await fetchData(getStrapiURL(`/global?populate=deep`))
  const globalData = global.data.attributes
  const { header, footer } = globalData
  let preview

  return (
    <html lang="en">
      <body>
        <ReduxProvider>
          <Layout
            preview={preview}
            header={header}
            footer={footer}
            children={children}
          />
        </ReduxProvider>
      </body>
    </html>
  )
}

export const metadata: Metadata = {
  title: {
    template: '%s | TVT Boilerplate',
    default: 'TVT Boilerplate'
  },
  description:
    'The official Taavetti Digital eCommerce and Marketing Website Boilerplate built with NextJS and Strapi.',
  metadataBase: new URL('https://taavetti.digital')
}
