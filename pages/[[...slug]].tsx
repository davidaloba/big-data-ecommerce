import { getData, getStrapiURL } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'
import { wrapper } from '@store/index'
import { getPageData, getRunningQueriesThunk, useGetPageDataQuery } from '@store/api'
import ErrorPage from 'next/error'
import Layout from '@components/layouts/layout'

// This gets called on every request
export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  const { slug, locale } = getLocalizedParams(context.query)
  const { url, type } = getData(slug, locale, context.preview)
  const apiUrl = getStrapiURL(url)

  try {
    store.dispatch(getPageData.initiate(apiUrl))
    await Promise.all(store.dispatch(getRunningQueriesThunk()))

    return {
      props: {
        apiUrl,
        type,
        preview: context.preview || null
      }
    }
  } catch (error) {
    return {
      props: { pageData: null }
    }
  }
})

const Page = ({ children, global, apiUrl, type, preview }) => {
  const {
    data: page,
    error: pageDataError,
    isSuccess: pageDataIsSuccess
  } = useGetPageDataQuery(apiUrl)

  if (pageDataError || !page) {
    return <ErrorPage statusCode={404} />
  }

  return (
    <Layout
      page={page}
      pageDataIsSuccess={pageDataIsSuccess}
      global={global}
      type={type}
      preview={preview}>
      {children}
    </Layout>
  )
}

export default Page
