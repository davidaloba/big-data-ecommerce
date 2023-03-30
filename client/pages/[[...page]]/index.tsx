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
import WebLayout from '@appComponents/layouts/layout.web'
import Seo from '@marketingComponents/partials/seo'

interface Page {
  children: ReactNode | undefined
  apiUrl: string
  preview: boolean | undefined
  pageType: string
  apiID: string
  pageID: string
}

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context: T) => {
  try {
    const { apiUrl, pageID, pageType, apiID } = getData(context.query.page || '', context.preview)

    store.dispatch(getPageData.initiate(apiUrl))
    store.dispatch(getGlobal.initiate('global'))
    await Promise.all(store.dispatch(getRunningQueriesThunk()))

    console.log(pageType, apiUrl)

    return {
      props: {
        apiUrl,
        preview: context.preview || null,
        pageType,
        pageID,
        apiID
      }
    }
  } catch (error) {
    return {
      props: {}
    }
  }
})

const Page = ({ children, apiUrl, pageType, pageID, preview }: Page) => {
  const { data: globalData, isSuccess: globalDataSuccess } = useGetGlobalQuery('global')
  const { data: pageData, isSuccess: pageDataSuccess } = useGetPageDataQuery(apiUrl)
  const global = globalData.data
  const page = Array.isArray(pageData.data) ? pageData.data[0] : pageData.data

  let LayoutComponent
  const pageTID = pageID === 'home' ? pageID : pageType
  switch (pageTID) {
    case 'page':
      LayoutComponent = MarketingLayout
      break
    default:
      LayoutComponent = WebLayout
      break
  }

  return !globalDataSuccess || !global || !pageDataSuccess || !page ? (
    <ErrorPage statusCode={404} />
  ) : (
    <LayoutComponent
      globalData={global.attributes}
      pageData={page.attributes}
      pageDataSuccess={pageDataSuccess}
      preview={preview}>
      <Seo seo={page.attributes.seo} />
      {children}
    </LayoutComponent>
  )
}
export default Page
