import { getData, getStrapiURL, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'

import Layout from '@components/layouts/layout'
import BlockManager from '@components/sections/BlockManager'
import Store from '@modules/store/store'

// This gets called on every request
export async function getServerSideProps(context) {
  const { slug, locale } = getLocalizedParams(context.query)
  const data = getData(null, 'store', 'index', locale, context.preview)

  try {
    const resProductPage = await fetch(data.url)
    const productPage = await resProductPage.json()
    const perPage = productPage.productsPerPage || 12

    const resProducts = await fetch(
      getStrapiURL(
        `/store?pagination[limit]=${perPage}&locale=${locale}&pagination[withCount]=true&populate=images,place,category,header`
      )
    )
    const store = await resProducts.json()

    const resCategories = await fetch(
      getStrapiURL(`/categories?pagination[limit]=99`)
    )
    const categories = await resCategories.json()

    const resPlaces = await fetch(getStrapiURL(`/places?pagination[limit]=99`))
    const places = await resPlaces.json()

    if (!store.data.length || !categories.data.length || !places.data.length) {
      return handleRedirection(slug, context.preview, '')
    }

    return {
      props: {
        initialData: {
          store: store.data,
          count: store.meta.pagination.total
        },
        pageData: productPage.data,
        categories: categories.data,
        places: places.data,
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

const Product = ({
  global,
  initialData,
  pageData,
  categories,
  places,
  locale,
  perPage,
  preview
}) => {
  const blocks = pageData.attributes.blocks
  return (
    <Layout
      global={global}
      pageData={pageData}
      type="store"
      preview={preview}>
      <Store
        pageData={pageData}
        initialData={initialData}
        categories={categories}
        places={places}
        locale={locale}
        perPage={perPage}
      />
      {blocks && <BlockManager blocks={blocks} />}
    </Layout>
  )
}

export default Product
