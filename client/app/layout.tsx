import { Metadata } from 'next'
import { getStrapiURL } from '@globalUtils/index'

import 'tailwindcss/tailwind.css'
import '@globalStyles/global.css'
import PreviewBanner from '@app/_global/components/partials/PreviewBanner'
import Header from '@app/_global/components/partials/Header'
import Main from '@app/_global/components/partials/Main'
import Footer from '@app/_global/components/partials/Footer'
import { ReduxProvider } from '@globalStore/providers'

async function getData() {
  const res = await fetch(getStrapiURL(`/global?populate=deep`))
  // The return value is *not* serialized
  // You can return Date, Map, Set, etc.

  if (!res.ok) {
    // This will activate the closest `error.js` Error Boundary
    throw new Error('Failed to fetch data')
  }

  return res.json()
}

export default async function RootLayout({ children }: { children: React.ReactNode }) {
  const global = await getData()
  const globalData = global.data.attributes
  const { header, footer } = globalData
  let preview

  return (
    <html lang="en">
      <body>
        <ReduxProvider>
          {preview && <PreviewBanner />}
          {header && <Header {...header} />}
          {children && <Main>{children}</Main>}
          {footer && <Footer {...footer} />}
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
