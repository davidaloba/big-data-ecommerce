const indexes = ['blog', 'shop', 'work']
const apiIDs = {
  page: 'page',
  blog: 'article',
  work: 'project',
  shop: 'product',
  collection: 'collection'
}

export function getData(slug: string | string[], preview: boolean) {
  const previewParams = preview ? '&publicationState=preview&published_at_null=true' : ''
  const pageType = indexes.includes(slug[0]) ? slug[0] : 'page'
  const pageID = !slug[slug.length - 1] ? '' : slug[slug.length - 1]

  const data = {
    url: '',
    pageType,
    pageID,
    type: 'page'
  }

  // handle Index Pages
  if (indexes.includes(slug[0])) {
    data.type = pageType
    data.url = `/${data.type}?${previewParams}&populate=deep`
    // handle Single Pages
  } else {
    data.type = pageType in apiIDs && apiIDs[pageType]
    data.url = `/${data.type}s?filters[slug][$eq]=/${pageID}${previewParams}&populate=deep`
  }

  return data
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
