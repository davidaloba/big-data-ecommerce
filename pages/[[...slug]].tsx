import ErrorPage from 'next/error'
import Layout from '@components/layouts/layout'
import { getData, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'

// This gets called on every request
export async function getServerSideProps(context) {
  const { slug, locale } = getLocalizedParams(context.query)
  const { url, collection, pageID, type } = getData(slug, locale, context.preview)

  try {
    // TODO: Fetch with Query Hook / Create global useGetPageDataQuery hook
    const res = await fetch(url)
    const page = await res.json()
    const perPage = page.articlesPerPage || 12

    console.log([slug[0], slug[slug.length - 1]], collection, pageID)

    if (!page.data) {
      return handleRedirection(context.preview, null)
    }

    return {
      props: {
        pageData: page.data[0] || page.data,
        perPage,
        locale,
        type,
        preview: context.preview || null
      }
    }
  } catch (error) {
    return {
      props: { pageData: null }
    }
  }
}

const Page = ({ children, global, pageData, type, preview }) => {
  if (pageData.length === 0) {
    return <ErrorPage statusCode={404} />
  }

  return (
    <Layout
      global={global}
      pageData={pageData}
      type={type}
      preview={preview}>
      {children}
    </Layout>
  )
}

export default Page
