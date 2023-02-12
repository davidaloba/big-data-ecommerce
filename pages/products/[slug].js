import { getStrapiURL, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'
import Layout from '@components/layouts/layout'
import Product from '@modules/products/product'
import SectionManager from '@components/sections/SectionManager'

export async function getServerSideProps(context) {
  const { locale } = getLocalizedParams(context.query)
  const preview = context.preview
    ? '&publicationState=preview&published_at_null=true'
    : ''
  const res = await fetch(
    getStrapiURL(
      `/restaurants?filters[slug]=${context.params.slug}&locale=${locale}${preview}&populate[reviews][populate]=author,author.picture&populate[information][populate]=opening_hours,location&populate[images][fields]=url&populate[category][fields]=name&populate[localizations]=*&populate[socialNetworks]=*&populate[blocks][populate]=restaurants.images,header,faq,buttons.link`
    )
  )
  const json = await res.json()

  if (!json.data.length) {
    return handleRedirection(
      context.params.slug,
      context.preview,
      'restaurants'
    )
  }

  return {
    props: {
      pageData: json.data[0],
      preview: context.preview || null
    }
  }
}

const Products = ({ global, preview, pageData }) => {
  const blocks = pageData.attributes.blocks
  return (
    <>
      <Layout
        global={global}
        pageData={pageData}
        preview={preview}
        type="restaurant">
        <Product pageData={{ ...pageData }} />
        {blocks && <SectionManager blocks={blocks} />}
      </Layout>
    </>
  )
}

export default Products
