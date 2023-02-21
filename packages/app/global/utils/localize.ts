// @ts-expect-error TS(6137): Cannot import type declaration files. Consider imp... Remove this comment to see the full error message
import type { Page } from '@types/models'
import { ParsedUrlQuery } from 'querystring'
import { getStrapiURL } from '.'

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

function getUrl(type: string, localization: object, targetLocale: string): string {
  switch (type) {
    case 'page':
      // @ts-expect-error TS(2339): Property 'id' does not exist on type 'object'.
      return `/pages/${localization.id}`
    case 'store':
      return `/store?locale=${targetLocale}`
    case 'blog':
      return `/blog?locale=${targetLocale}`
    case 'article':
      // @ts-expect-error TS(2339): Property 'id' does not exist on type 'object'.
      return `/articles/${localization.id}?locale=${targetLocale}`
    case 'product':
      // @ts-expect-error TS(2339): Property 'id' does not exist on type 'object'.
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
  // @ts-expect-error TS(2339): Property 'data' does not exist on type 'object'.
  const localization = pageData.localizations.data.find(
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
    // @ts-expect-error TS(2339): Property 'data' does not exist on type 'object'.
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