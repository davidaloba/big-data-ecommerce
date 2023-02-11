import { getStrapiURL } from '@utils/index'

export async function getProducts(key) {
  const categoryName = key.queryKey[1].category
  const placeName = key.queryKey[2].place
  const localeCode = key.queryKey[3].locale
  const pageNumber = key.queryKey[4].page
  const perPage = key.queryKey[5].perPage
  const start = +pageNumber === 1 ? 0 : (+pageNumber - 1) * perPage

  let baseUrl = getStrapiURL(
    `/restaurants?pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=images,category,place,information,seo`
  )

  if (categoryName) {
    baseUrl = `${baseUrl}&filters[category][name][$eq]=${categoryName}`
  }

  if (placeName) {
    baseUrl = `${baseUrl}&filters[place][name][$eq]=${placeName}`
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
