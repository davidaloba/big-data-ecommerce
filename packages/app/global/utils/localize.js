import { getStrapiURL } from './'

export function getLocalizedParams(query) {
  const lang = query.lang
  const slug = query.slug

  return { slug: slug || '', locale: lang || 'en' }
}

export function localizePath(localePage, type) {
  const { locale, slug } = localePage

  switch (type) {
    case 'product':
      return `/store/${slug}?lang=${locale}`
    case 'article':
      return `/blog/${slug}?lang=${locale}`

    default:
      return `/${slug}?lang=${locale}`
  }
}

function getUrl(type, localization, targetLocale) {
  switch (type) {
    case 'page':
      return `/pages/${localization.id}`
    case 'store':
      return `/store?locale=${targetLocale}`
    case 'blog':
      return `/blog?locale=${targetLocale}`
    case 'article':
      return `/articles/${localization.id}?locale=${targetLocale}`
    case 'product':
      return `/store/${localization.id}?locale=${targetLocale}`
    default:
      break
  }
}

export async function getLocalizedData(targetLocale, pageData, type) {
  const localization = pageData.localizations.data.find(
    (localization) => localization.attributes.locale === 'fr-FR'
  )
  const url = getUrl(type, localization, targetLocale)
  const res = await fetch(getStrapiURL(url))
  const localePage = await res.json()
  return localePage
}

export async function listLocalizedPaths(pageData, type) {
  const currentPage = {
    locale: pageData.locale,
    href: localizePath(pageData, type)
  }
  const paths = await Promise.all(
    pageData.localizations.data.map(async (localization) => {
      const url = getUrl(type, localization, localization.attributes.locale)
      const res = await fetch(getStrapiURL(url))
      const localePage = await res.json()
      const page = { ...pageData, ...localePage.data.attributes }
      return {
        locale: page.locale,
        href: localizePath(page, type)
      }
    })
  )

  const localizedPaths = [currentPage, ...paths]
  return localizedPaths
}
