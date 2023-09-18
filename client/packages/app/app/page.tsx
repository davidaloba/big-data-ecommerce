import { Metadata } from 'next'

import PageRouter from '@globalComponents/routers/page-router'

export default function Page() {
  return <PageRouter />
}

export const metadata: Metadata = {
  title: 'Next.js'
}
