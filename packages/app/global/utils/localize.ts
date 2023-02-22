import { ParsedUrlQuery } from 'querystring'
import { getStrapiURL } from '.'
import { Page } from '@__types/models'

export function getLocalizedParams(query: ParsedUrlQuery) {
  const lang = query.lang
  const slug = query.slug

  return { slug: slug || '', locale: lang || 'en' }
}

export function localizePath(localePage: Page['attributes'], type: string) {
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

function getUrl(type: string, localization, targetLocale: string): string {
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

export async function getLocalizedData(
  targetLocale: string,
  pageData: Page['attributes'],
  type: string
) {
  const localization: object = pageData.localizations.data.find(
    (localization: any) => localization.attributes.locale === 'fr-FR'
  )
  const url = getUrl(type, localization, targetLocale)
  const res = await fetch(getStrapiURL(url))
  const localePage = await res.json()
  return localePage
}

export async function listLocalizedPaths(pageData: Page['attributes'], type: string) {
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
