import { Metadata } from 'next'
import { getStrapiURL } from '@globalUtils/index'
import { ReduxProvider } from '@globalStore/providers'
import { fetchData } from '@globalUtils/actions'

import 'tailwindcss/tailwind.css'
import '@globalStyles/global.css'
import PreviewBanner from '@globalComponents/partials/PreviewBanner'
import Header from '@globalComponents/partials/Header'
import Main from '@globalComponents/partials/Main'
import Footer from '@globalComponents/partials/Footer'

export default async function RootLayout({ children }: { children: React.ReactNode }) {
  const global = await fetchData(getStrapiURL(`/global?populate=deep`))
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
