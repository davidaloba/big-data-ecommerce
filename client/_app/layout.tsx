import { Metadata } from 'next'
import 'tailwindcss/tailwind.css'
import '@globalStyles/global.css'
import LayoutRouter from '@globalComponents/routers/layout-router'
import { Providers } from '@globalStore/providers'

const RootLayout = ({ children }: { children: React.ReactNode }) => {
  return (
    <html lang="en">
      <body>
        <Providers>
          <LayoutRouter>{children}</LayoutRouter>
        </Providers>
      </body>
    </html>
  )
}

export default RootLayout

export const metadata: Metadata = {
  title: 'Next.js'
}
