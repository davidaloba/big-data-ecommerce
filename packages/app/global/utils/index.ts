export function getStrapiMedia(url) {
  if (url == null) {
    return null
  }
  if (url.startsWith('http') || url.startsWith('//')) {
    return url
  }
  return `${process.env.NEXT_PUBLIC_API_URL || 'http://localhost:1337'}${url}`
}

export function getStrapiURL(path) {
  return `${
    process.env.NEXT_PUBLIC_API_URL || 'http://localhost:1337'
  }/api${path}`
}

export function getData(slug, type, kind, locale, preview) {
  const previewParams = preview
    ? '&publicationState=preview&published_at_null=true'
    : ''
  // Single Page
  const apiID = type
  if (kind == 'single') {
    if (type === 'product') {
      const apiUrl = `/${apiID}s?filters[slug]=${slug}&locale=${locale}${previewParams}&populate[reviews][populate]=author,author.picture&populate[information][populate]=opening_hours,location&populate[images][fields]=url&populate[category][fields]=name&populate[localizations]=*&populate[socialNetworks]=*&populate[blocks][populate]=store.images,header,faq,buttons.link`
      return {
        url: getStrapiURL(apiUrl)
      }
    }
    if (type === 'article') {
      const apiUrl = `/${apiID}s?filters[slug][$eq]=${slug}&locale=${locale}${previewParams}&populate=localizations,image,author.picture,blocks.articles.image,blocks.faq,blocks.header`
      return {
        url: getStrapiURL(apiUrl)
      }
    }
    if (type === 'page') {
      const apiUrl = `/${apiID}s?filters[slug][$eq]=${slug}&locale=${locale}${previewParams}&populate[blocks][populate]=members.picture,header,buttons.link,faq,featuresCheck,cards,pricingCards.perks,articles,store,author.picture,images,cards.image,image&populate=localizations&populate[seo][populate]=metaSocial.image`
      return {
        url: getStrapiURL(apiUrl)
      }
    }
  } // Collection(Index) Page
  else {
    const apiUrl = `/${apiID}?locale=${locale}${previewParams}&populate[blocks][populate]=*,buttons.link&populate=localizations&populate[header]=*&populate[seo]=metaSocial`

    return {
      url: getStrapiURL(apiUrl)
    }
  }
}

export function handleRedirection(preview, custom) {
  if (preview) {
    return {
      redirect: {
        destination: `/api/exit-preview`,
        permanent: false
      }
    }
  } else if (custom) {
    return {
      redirect: {
        destination: `/${custom}`,
        permanent: false
      }
    }
  } else {
    return {
      redirect: {
        destination: `/`,
        permanent: false
      }
    }
  }
}

export const getPeriod = (totalMinutes) => {
  // const diffTime = Math.abs(new Date().valueOf() - new Date(date).valueOf())
  function padTo2Digits(num) {
    return num.toString().padStart(2, '0')
  }
  const minutes = totalMinutes % 60
  const hours = Math.floor(totalMinutes / 60)
  return `${padTo2Digits(hours)}h ${padTo2Digits(minutes)}m`
}

export const numberWithCommas = (x) => {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
}
