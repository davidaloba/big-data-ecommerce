const indexes = ['blog', 'shop']
const apiIDs = {
  blog: 'article',
  shop: 'product',
  page: 'page'
}

export function getStrapiMedia(url: string) {
  if (url == null) {
    return null
  }
  if (url.startsWith('http') || url.startsWith('//')) {
    return url
  }
  return `${process.env.NEXT_PUBLIC_API_URL || 'http://localhost:1337'}${url}`
}

export function getStrapiURL(path: string) {
  return `${process.env.NEXT_PUBLIC_API_URL || 'http://localhost:1337'}/api${path}`
}

export function getData(slug: string | string[], preview: boolean) {
  const pageType = indexes.includes(slug[0]) ? slug[0] : 'page'
  const pageID = !slug[slug.length - 1] ? '' : slug[slug.length - 1]
  const previewParams = preview ? '&publicationState=preview&published_at_null=true' : ''

  if (pageID === pageType) {
    const apiID = pageType
    const apiUrl = `/${apiID}?${previewParams}&populate=deep`

    return {
      url: apiUrl,
      pageType,
      pageID,
      type: apiID
    }
  } else {
    const apiID = pageType in apiIDs && apiIDs[pageType]
    const apiUrl = `/${apiID}s?filters[slug][$eq]=${pageID}${previewParams}&populate=deep`

    return {
      url: apiUrl,
      pageType,
      pageID,
      type: apiID
    }
  }
}

export function handleRedirection(preview: boolean, custom: string) {
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

export const getPeriod = (totalMinutes: number) => {
  // const diffTime = Math.abs(new Date().valueOf() - new Date(date).valueOf())
  function padTo2Digits(num: number) {
    return num.toString().padStart(2, '0')
  }
  const minutes = totalMinutes % 60
  const hours = Math.floor(totalMinutes / 60)
  return `${padTo2Digits(hours)}h ${padTo2Digits(minutes)}m`
}

export const numberWithCommas = (x: number) => {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
}
