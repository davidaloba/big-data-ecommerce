import { fetchData } from '@globalUtils/actions'
import { getStrapiApi } from '@globalUtils/index'

import Content from '@globalComponents/content'
import ErrorPage from '@globalComponents/pages/404'

export default async function Page({ params }: { params: { slug: string } }) {
  const { apiUrl, contentType } = getStrapiApi(params.slug)
  const page = await fetchData(apiUrl)

  if (Array.isArray(page.data) && page.data.length === 0) return <ErrorPage />
  return (
    <Content
      contentType={contentType}
      pageData={Array.isArray(page.data) ? page.data[0].attributes : page.data.attributes}
    />
  )
}
