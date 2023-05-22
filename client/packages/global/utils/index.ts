const indexes = ['blog', 'work', 'shop', 'checkout', 'cart', 'category', 'topic', 'author', 'order']
const contentTypes = {
  page: 'pages',
  blog: 'articles',
  topic: 'topics',
  author: 'authors',
  work: 'projects',
  shop: 'products',
  category: 'categories',
  order: 'orders'
}

export function getData(slug: string | string[], preview?: boolean) {
  const previewParams = preview ? '&publicationState=preview&published_at_null=true' : ''
  const index = indexes.includes(slug[0]) ? slug[0] : 'page'
  const pageID = !slug[slug.length - 1] ? 'home' : slug[slug.length - 1]

  const data = {
    apiUrl: '',
    pageID,
    contentType: ''
  }
  // handle Index Pages
  if (indexes.includes(slug[0]) && slug.length === 1) {
    data.contentType = index
    data.apiUrl = getStrapiURL(`/${data.contentType}?${previewParams}&populate=deep`)
    // handle Single Pages
  } else {
    data.contentType = index in contentTypes && contentTypes[index]
    data.apiUrl = getStrapiURL(
      `/${data.contentType}?filters[slug][$eq]=${pageID}${previewParams}&populate=deep`
      // `/${data.contentType}/${pageID}?${previewParams}&populate=deep`
    )
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
  return `${process.env.NEXT_PUBLIC_API_URL}${url}`
}

export function getStrapiURL(path: string) {
  return `${process.env.NEXT_PUBLIC_API_URL}/api${path}`
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

export const fetchHoverImg = async (slug: string, setData: Function) => {
  fetch(
    `${process.env.NEXT_PUBLIC_API_URL}/api/products?filters[slug][$eq]=${slug}&populate[hoverImage][populate][0]=url`
  )
    .then((res) => {
      if (res.ok) {
        return res.json()
      }
      throw res
    })
    .then((data) => {
      setData(getStrapiMedia(data.data[0].attributes.hoverImage.data.attributes.url))
    })
    .catch((err) => {
      console.error('Error fetching data:', err)
    })
}

// const [topics, setTopics] = useState([])
// const fetchTopics = async () => {
//   fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/topics?populate=deep`)
//     .then((res) => {
//       if (res.ok) {
//         return res.json()
//       }
//       throw res
//     })
//     .then((data) => {
//       setTopics(data.data)
//     })
//     .catch((err) => {
//       console.error('Error fetching data:', err)
//     })
// }
// useEffect(() => {
//   fetchTopics()
// }, [])
