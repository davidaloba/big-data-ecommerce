import { getData, getStrapiURL, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'

import Layout from '@components/layouts/layout'
import BlockManager from '@components/blocks/BlockManager'
import Articles from '@modules/blog/Articles'

// This gets called on every request
export async function getServerSideProps(context) {
  const { slug, locale } = getLocalizedParams(context.query)
  const data = getData(null, 'blog', 'index', locale, context.preview)

  try {
    const resBlogPage = await fetch(data.url)
    const blogPage = await resBlogPage.json()

    const perPage = blogPage.articlesPerPage || 12

    const resArticles = await fetch(
      getStrapiURL(
        `/articles?pagination[limit]=${perPage}&locale=${locale}&pagination[withCount]=true&populate=image,category,author`
      )
    )
    const articles = await resArticles.json()

    const resCategories = await fetch(
      getStrapiURL(`/categories?pagination[limit]=99`)
    )
    const categories = await resCategories.json()

    if (!articles.data.length || !categories.data.length) {
      return handleRedirection(slug, context.preview, '')
    }

    return {
      props: {
        initialData: {
          articles: articles.data,
          count: articles.meta.pagination.total
        },
        pageData: blogPage.data,
        categories: categories.data,
        locale,
        perPage,
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

const Blog = ({
  global,
  initialData,
  pageData,
  categories,
  locale,
  perPage,
  preview
}) => {
  const blocks = pageData.attributes.blocks
  return (
    <Layout
      global={global}
      pageData={pageData}
      type="blog"
      preview={preview}>
      <Articles
        initialData={initialData}
        pageData={pageData}
        categories={categories}
        locale={locale}
        perPage={perPage}
      />
      {blocks && <BlockManager blocks={blocks} />}
    </Layout>
  )
}

export default Blog
