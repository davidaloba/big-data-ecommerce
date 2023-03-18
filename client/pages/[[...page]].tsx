import { ReactNode } from 'react'
import ErrorPage from 'next/error'
import { getData, getStrapiURL } from '@marketingUtils/index'
import { wrapper } from '@marketingStore/index'
import {
  getGlobal,
  getPageData,
  getRunningQueriesThunk,
  useGetGlobalQuery,
  useGetPageDataQuery
} from '@marketingStore/api'
import Layout from '@marketingComponents/layouts/layout'
import { Global } from '@marketingTypes/models'

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  try {
    const { url } = getData(context.query.page || '', context.preview)
    const apiUrl = getStrapiURL(url)
    store.dispatch(getPageData.initiate(apiUrl))
    store.dispatch(getGlobal.initiate('global'))
    await Promise.all(store.dispatch(getRunningQueriesThunk()))

    return {
      props: {
        apiUrl: apiUrl,
        preview: context.preview || null
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
}

const Page = ({ children, apiUrl, preview }: Page) => {
  const { data: globalData, isSuccess: globalDataSuccess } = useGetGlobalQuery('global')
  const { data: pageData, isSuccess: pageDataSuccess } = useGetPageDataQuery(apiUrl)

  const global = globalData.data as Global
  const page = Array.isArray(pageData.data) ? pageData.data[0] : pageData.data
  console.log(page)

  if (!globalDataSuccess || !global || !pageDataSuccess || !page) {
    return <ErrorPage statusCode={404} />
  }

  return (
    <Layout
      globalData={global.attributes}
      pageData={page.attributes}
      pageDataSuccess={pageDataSuccess}
      preview={preview}>
      {children}
    </Layout>
  )
}
export default Page
