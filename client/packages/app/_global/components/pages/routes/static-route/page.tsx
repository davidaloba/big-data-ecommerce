import { getStrapiURL } from '@globalUtils/index'
import { fetchData } from '@globalUtils/actions'

import Blog from '@blogComponents/Blog'

export default async function Page() {
  const page = await fetchData(getStrapiURL(`/blog?populate[0]=deep`))
  const pageData = Array.isArray(page.data) ? page.data[0].attributes : page.data.attributes

  return <Blog {...pageData} />
}
