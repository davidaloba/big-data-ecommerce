import { getStrapiURL } from '@globalUtils/index'
import Blog from '@blogComponents/Blog'

async function getData() {
  const res = await fetch(getStrapiURL(`/blog?populate[0]=deep`))
  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }

  return res.json()
}

export default async function Page() {
  const page = await getData()
  const pageData = Array.isArray(page.data) ? page.data[0].attributes : page.data.attributes

  return <Blog {...pageData} />
}
