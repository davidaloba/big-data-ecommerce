import { getData, getStrapiURL, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'
import Layout from '@components/layouts/layout'
import BlockManager from '@components/blocks/BlockManager'
import Articles from '@modules/blog/Articles'

// This gets called on every request
export async function getServerSideProps(context) {
  const { slug, locale } = getLocalizedParams(context.query)
  const data = getData(slug, 'blog', 'index', locale, context.preview)

  try {
    const res = await fetch(data.url)
    const page = await res.json()
    const perPage = page.articlesPerPage || 12

    if (!page.data.length) {
      return handleRedirection(context.preview, null)
    }

    return {
      props: {
        pageData: page.data,
        perPage,
        locale,
        preview: context.preview || null
      }
    }
  } catch (error) {
    return {
      redirect: {
        destination: '/',
        permanent: false
      }
    }
  }
}

const Blog = ({ global, pageData, locale, perPage, preview }) => {
  const blocks = pageData.attributes.blocks
  return (
    <Layout
      global={global}
      pageData={pageData}
      type="blog"
      preview={preview}>
      <Articles
        pageData={pageData}
        locale={locale}
        perPage={perPage}
      />
      {blocks && <BlockManager blocks={blocks} />}
    </Layout>
  )
}

export default Blog
