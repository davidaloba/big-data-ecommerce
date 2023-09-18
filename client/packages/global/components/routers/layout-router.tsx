'use client'
import { usePathname } from 'next/navigation'

import { useGetGlobalQuery } from '@globalStore/api'
import { getData } from '@globalUtils/index'

import ErrorPage from 'next/error'
import GlobalLayout from '@globalComponents/layouts/layout'

const LayoutRouter = ({ children }) => {
  const { pageID, contentType } = getData(usePathname())
  const { data: globalData } = useGetGlobalQuery('global')

  if (!globalData) return <ErrorPage statusCode={404} />

  const pageTID = pageID === 'home' ? pageID : contentType

  let Layout
  switch (pageTID) {
    default:
      Layout = GlobalLayout
      break
  }

  return <Layout globalData={globalData}>{children}</Layout>
}

export default LayoutRouter
