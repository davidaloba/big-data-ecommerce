import BlockManager from '@app/pages/components/BlockManager'
import { getStrapiURL } from '@globalUtils/index'

async function getData() {
  const res = await fetch(getStrapiURL(`/pages?filters[slug][$eq]=home&populate[0]=deep`))
  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }

  return res.json()
}

export default async function Page() {
  const page = await getData()
  const pageData = Array.isArray(page.data) ? page.data[0].attributes : page.data.attributes

  return <BlockManager {...pageData} />
}
