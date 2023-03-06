import { ReactNode } from 'react'
import ErrorPage from 'next/error'
import { getData, getStrapiURL } from '@siteUtils/index'
import { wrapper } from '@siteStore/index'
import {
  getGlobal,
  getPageData,
  getRunningQueriesThunk,
  useGetGlobalQuery,
  useGetPageDataQuery
} from '@siteStore/api'
import Layout from '@siteComponents/layouts/layout'
import { Global } from '@siteTypes/models'

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  const { url } = getData(context.query.page || '', context.preview)
  const apiUrl = getStrapiURL(url)

  try {
    store.dispatch(getGlobal.initiate('global'))
    await Promise.all(store.dispatch(getRunningQueriesThunk()))

    store.dispatch(getPageData.initiate(apiUrl))
    await Promise.all(store.dispatch(getRunningQueriesThunk()))

    return {
      props: {
        apiUrl,
        preview: context.preview || null
      }
    }
  } catch (error) {
    return {
      props: {}
    }
  }
})

const Page = ({
  children,
  apiUrl,
  preview
}: {
  children: ReactNode | undefined
  apiUrl: string
  preview: boolean | undefined
}) => {
  const { data: globalData, error: globalDataError } = useGetGlobalQuery('global')
  const global = globalData.data as Global

  const {
    data: pageData,
    error: pageDataError,
    isSuccess: pageDataIsSuccess
  } = useGetPageDataQuery(apiUrl)
  const page = Array.isArray(pageData.data) ? pageData.data[0] : pageData.data

  if (globalDataError || !global || pageDataError || !page) {
    return <ErrorPage statusCode={404} />
  }

  return (
    <Layout
      globalData={global.attributes}
      pageData={page.attributes}
      pageDataIsSuccess={pageDataIsSuccess}
      preview={preview}>
      {children}
    </Layout>
  )
}
export default Page
