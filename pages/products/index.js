import { getData, getStrapiURL, handleRedirection } from '@utils/index'
import { getLocalizedParams } from '@utils/localize'

import Layout from '@components/layouts/layout'
import SectionManager from '@components/sections/SectionManager'
import Products from '@modules/products/products'

// This gets called on every request
export async function getServerSideProps(context) {
  const { slug, locale } = getLocalizedParams(context.query)

  const data = getData(
    null,
    locale,
    'restaurant-page',
    'singleType',
    context.preview
  )

  try {
    const resProductPage = await fetch(data.data)
    const productPage = await resProductPage.json()
    const perPage = productPage.restaurantsPerPage || 12

    const resProducts = await fetch(
      getStrapiURL(
        `/restaurants?pagination[limit]=${perPage}&locale=${locale}&pagination[withCount]=true&populate=images,place,category,header`
      )
    )
    const products = await resProducts.json()

    const resCategories = await fetch(
      getStrapiURL(`/categories?pagination[limit]=99`)
    )
    const categories = await resCategories.json()

    const resPlaces = await fetch(getStrapiURL(`/places?pagination[limit]=99`))
    const places = await resPlaces.json()

    if (
      !products.data.length ||
      !categories.data.length ||
      !places.data.length
    ) {
      return handleRedirection(slug, context.preview, '')
    }

    return {
      props: {
        initialData: {
          products: products.data,
          count: products.meta.pagination.total
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
      type="restaurant-page"
      preview={preview}>
      <Products
        pageData={pageData}
        initialData={initialData}
        categories={categories}
        places={places}
        locale={locale}
        perPage={perPage}
      />
      {blocks && <SectionManager blocks={blocks} />}
    </Layout>
  )
}

export default Product
