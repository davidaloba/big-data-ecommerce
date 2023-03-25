import { ReactNode } from 'react'
import ErrorPage from 'next/error'
import { getData, getStrapiURL } from '@globalUtils/index'
import { wrapper } from '@globalStore/index'
import {
  getGlobal,
  getPageData,
  getRunningQueriesThunk,
  useGetGlobalQuery,
  useGetPageDataQuery
} from '@globalStore/api'
import { Global } from '@globalTypes/models'
import MarketingLayout from '@marketingComponents/layouts/layout'
import AppLayout from '@appComponents/layouts/layout'

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  try {
    const { url, pageType, type } = getData(context.query.page || '', context.preview)
    const apiUrl = getStrapiURL(url)
    store.dispatch(getPageData.initiate(apiUrl))
    store.dispatch(getGlobal.initiate('global'))
    await Promise.all(store.dispatch(getRunningQueriesThunk()))

    return {
      props: {
        apiUrl,
        preview: context.preview || null,
        pageType,
        type
      }
    }
  } catch (error) {
    return {
      props: {}
    }
  }
})

interface Page {
  children: ReactNode | undefined
  apiUrl: string
  preview: boolean | undefined
  pageType: string
  type: string
}

const Page = ({ children, apiUrl, pageType, type, preview }: Page) => {
  console.log(pageType, type)

  const { data: globalData, isSuccess: globalDataSuccess } = useGetGlobalQuery('global')
  const { data: pageData, isSuccess: pageDataSuccess } = useGetPageDataQuery(apiUrl)

  const global = globalData.data as Global
  const page = Array.isArray(pageData.data) ? pageData.data[0] : pageData.data

  if (!globalDataSuccess || !global || !pageDataSuccess || !page) {
    return <ErrorPage statusCode={404} />
  }

  let LayoutComponent
  switch (type) {
    default:
      LayoutComponent = MarketingLayout
      break
    case 'app':
      LayoutComponent = AppLayout
      break
  }

  return (
    <LayoutComponent
      globalData={global.attributes}
      pageData={page.attributes}
      pageDataSuccess={pageDataSuccess}
      preview={preview}>
      {children}
    </LayoutComponent>
  )
}
export default Page
