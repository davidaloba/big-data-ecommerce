import { getStrapiURL } from '@siteUtils/index'

export async function getProducts(key) {
  const categoryName = key.queryKey[1].category
  const tagName = key.queryKey[2].tag
  const localeCode = key.queryKey[3].locale
  const pageNumber = key.queryKey[4].page
  const perPage = key.queryKey[5].perPage
  const start = +pageNumber === 1 ? 0 : (+pageNumber - 1) * perPage

  let baseUrl = getStrapiURL(
    `/shop?pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=images,category,tag,information,seo`
  )

  if (categoryName) {
    baseUrl = `${baseUrl}&filters[category][name][$eq]=${categoryName}`
  }

  if (tagName) {
    baseUrl = `${baseUrl}&filters[tag][name][$eq]=${tagName}`
  }

  if (localeCode) {
    baseUrl = `${baseUrl}&locale=${localeCode}`
  }

  const res = await fetch(baseUrl)
  const products = await res.json()

  return {
    products: products.data,
    count: products.meta.pagination.total
  }
}
