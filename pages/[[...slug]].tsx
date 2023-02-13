import ErrorPage from 'next/error'
import Layout from '@components/layouts/layout'
import { getData, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'
// import PageLayout from '@components/layouts/layout'

// This gets called on every request
export async function getServerSideProps(context) {
  const { slug, locale } = getLocalizedParams(context.query)
  const data = getData(slug, 'page', 'single', locale, context.preview)

  try {
    const res = await fetch(data.url)
    const json = await res.json()
    console.log(json.data[0])

    if (!json.data.length) {
      return handleRedirection(context.preview, null)
    }

    return {
      props: { pageData: json.data[0], preview: context.preview || null }
    }
  } catch (error) {
    return {
      props: { pageData: null }
    }
  }
}

const Universals = ({ children, global, pageData, preview }) => {
  if (pageData === null) {
    return <ErrorPage statusCode={404} />
  }

  return (
    <Layout
      global={global}
      pageData={pageData}
      type="pages"
      preview={preview}>
      {children}
    </Layout>
  )
}

export default Universals
