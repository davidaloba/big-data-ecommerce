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
  return `${process.env.NEXT_PUBLIC_API_URL || 'http://localhost:1337'}/api${path}`
}

export function getData(slug, locale, preview) {
  const previewParams = preview ? '&publicationState=preview&published_at_null=true' : ''
  const pageID = slug[slug.length - 1] ? slug[slug.length - 1] : slug[0] || ''
  // TODO: Refactor collection so as not to hard code type checking for each collection
  const collection = slug[0] === 'blog' ? slug[0] : slug[0] === 'shop' ? 'shop' : 'page'

  // Index Page (singleType) - returns Object
  if (pageID === collection) {
    const apiID = collection
    const apiUrl = `/${apiID}?locale=${locale}${previewParams}&populate=deep`

    return {
      url: getStrapiURL(apiUrl),
      collection,
      pageID,
      type: apiID
    }
  } // Single Page (CollectionType) - returns Array
  else {
    const apiID = collection === 'blog' ? 'article' : collection === 'shop' ? 'product' : 'page'

    const apiUrl = `/${apiID}s?filters[slug][$eq]=${pageID}&locale=${locale}${previewParams}&populate=deep`
    return {
      url: getStrapiURL(apiUrl),
      collection,
      pageID,
      type: apiID
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
