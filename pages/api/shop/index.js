import { getData, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'

import Layout from '@components/layouts/layout'
import BlockManager from '@components/sections/BlockManager'
import Products from '@modules/shop/products'

// This gets called on every request
export async function getServerSideProps(context) {
  const { slug, locale } = getLocalizedParams(context.query)
  const data = getData(null, 'shop', 'index', locale, context.preview)

  try {
    const res = await fetch(data.url)
    const page = await res.json()
    const perPage = page.articlesPerPage || 12

    if (!page.data.length) {
      return handleRedirection(slug, context.preview, '')
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

const Product = ({ global, pageData, locale, perPage, preview }) => {
  const blocks = pageData.attributes.blocks
  return (
    <Layout
      global={global}
      pageData={pageData}
      type="shop"
      preview={preview}>
      <Products
        pageData={pageData}
        locale={locale}
        perPage={perPage}
      />
      {blocks && <BlockManager blocks={blocks} />}
    </Layout>
  )
}

export default Product
