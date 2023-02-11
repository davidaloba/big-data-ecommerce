import ArticleContent from '@modules/blog/Article'
import Layout from '@components/layouts/layout'

import { getStrapiURL, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'

// This gets called on every request
export async function getServerSideProps(context) {
  const { locale } = getLocalizedParams(context.query)
  const preview = context.preview
    ? '&publicationState=preview&published_at_null=true'
    : ''
  const res = await fetch(
    getStrapiURL(
      `/articles?filters[slug]=${context.params.slug}&locale=${locale}${preview}&populate=localizations,image,author.picture,blocks.articles.image,blocks.faq,blocks.header`
    )
  )
  const json = await res.json()

  if (!json.data.length) {
    return handleRedirection(context.params.slug, context.preview, 'blog')
  }

  return {
    props: { pageData: json.data[0], preview: context.preview || null }
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
