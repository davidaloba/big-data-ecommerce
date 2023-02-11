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

export function getData(slug, locale, apiID, kind, preview) {
  const previewParams = preview
    ? '&publicationState=preview&published_at_null=true'
    : ''

  if (kind == 'collectionType') {
    let prefix = `/${apiID}s`
    if (apiID == 'page') {
      prefix = ``
    } else if (apiID == 'article') {
      prefix = `/blog`
    }
    const slugToReturn = `${prefix}/${slug}?lang=${locale}`
    const apiUrl = `/${apiID}s?filters[slug][$eq]=${slug}&locale=${locale}${previewParams}&populate[blocks][populate]=members.picture,header,buttons.link,faq,featuresCheck,cards,pricingCards.perks,articles,restaurants,author.picture,images,cards.image,image&populate=localizations&populate[seo][populate]=metaSocial.image`

    return {
      data: getStrapiURL(apiUrl),
      slug: slugToReturn
    }
  } else {
    const apiUrl = `/${apiID}?locale=${locale}${previewParams}&populate[blocks][populate]=*,buttons.link&populate=localizations&populate[header]=*&populate[seo]=metaSocial`

    if (apiID.includes('-page')) {
      const slugToReturn =
        apiID == 'blog-page'
          ? `/${apiID.replace('-page', '')}?lang=${locale}`
          : `/${apiID.replace('-page', 's')}?lang=${locale}`
      return {
        data: getStrapiURL(apiUrl),
        slug: slugToReturn
      }
    } else {
      return {
        data: getStrapiURL(apiUrl),
        slug: `/${apiID}?lang=${locale}`
      }
    }
  }
}
