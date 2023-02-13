import ArticleContent from '@modules/blog/Article'
import Layout from '@components/layouts/layout'

import { getData, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'

// This gets called on every request
export async function getServerSideProps(context) {
  const { slug, locale } = getLocalizedParams(context.query)
  const data = getData(slug, 'article', 'single', locale, context.preview)

  try {
    const res = await fetch(data.url)
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

const Article = ({ global, pageData, preview }) => {
  return (
    <>
      <Layout
        global={global}
        pageData={pageData}
        preview={preview}
        type="article">
        <ArticleContent {...pageData} />
      </Layout>
    </>
  )
}

export default Article
