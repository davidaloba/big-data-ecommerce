import ErrorPage from 'next/error'
import Layout from '@components/layouts/layout'
import BlockManager from '@components/blocks/BlockManager'
import { getData, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'
// import PageLayout from '@components/layouts/layout'

// This gets called on every request
export async function getServerSideProps(context) {
  const { slug, locale } = getLocalizedParams(context.query)

  try {
    const data = getData(
      slug,
      locale,
      'page',
      'collectionType',
      context.preview
    )
    const res = await fetch(data.data)
    const json = await res.json()

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

const Universals = ({ global, pageData, preview }) => {
  if (pageData === null) {
    return <ErrorPage statusCode={404} />
  }

  const blocks = pageData.attributes.blocks

  return (
    <Layout
      global={global}
      pageData={pageData}
      type="pages"
      preview={preview}>
      {blocks && <BlockManager blocks={blocks} />}
    </Layout>
  )
}

export default Universals
