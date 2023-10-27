import { getStrapiURL } from '@globalUtils/index'
import { fetchData } from '@globalUtils/actions'

import Article from '@blogComponents/Article'

export default async function Page({ params }: { params: { slug: string } }) {
  const page = await fetchData(
    getStrapiURL(`/articles?filters[slug][$eq]=${params.slug}&populate[0]=deep`)
  )
  const pageData = Array.isArray(page.data) ? page.data[0].attributes : page.data.attributes

  return <Article {...pageData} />
}
