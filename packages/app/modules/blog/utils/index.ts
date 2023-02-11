import { getStrapiURL } from '@utils/index'

export async function getArticles(key) {
  const categoryName = key.queryKey[1].category
  const localeCode = key.queryKey[2].locale
  const pageNumber = key.queryKey[3].page
  const perPage = key.queryKey[4].perPage

  const start = +pageNumber === 1 ? 0 : (+pageNumber - 1) * perPage

  let baseUrl = getStrapiURL(
    `/articles?pagination[limit]=${perPage}&pagination[start]=${start}&pagination[withCount]=true&populate=image,category,author,seo`
  )

  if (categoryName) {
    baseUrl = `${baseUrl}&filters[category][name][$eq]=${categoryName}`
  }

  if (localeCode) {
    baseUrl = `${baseUrl}&locale=${localeCode}`
  }

  const res = await fetch(baseUrl)
  const articles = await res.json()

  return { articles: articles.data, count: articles.meta.pagination.total }
}
