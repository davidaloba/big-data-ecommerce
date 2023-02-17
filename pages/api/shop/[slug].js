import { getData, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'
import Layout from '@components/layouts/layout'
import Product from '@modules/shop/product'
import BlockManager from '@components/sections/BlockManager'

export async function getServerSideProps(context) {
  const { slug, locale } = getLocalizedParams(context.query)
  const data = getData(slug, 'product', 'single', locale, context.preview)

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

const Shop = ({ global, preview, pageData }) => {
  const blocks = pageData.attributes.blocks
  return (
    <>
      <Layout
        global={global}
        pageData={pageData}
        preview={preview}
        type="product">
        <Product pageData={{ ...pageData }} />
        {blocks && <BlockManager blocks={blocks} />}
      </Layout>
    </>
  )
}

export default Shop
