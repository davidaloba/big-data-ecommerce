import React from 'react'
import { fetchData } from '@globalUtils/actions'
import { getStrapiApi } from '@globalUtils/index'

import Content from '@globalComponents/partials/Body/content'
import ErrorPage from '@globalComponents/__lib/pages/404'

/**
 * Retrieves data from an API based on the slug parameter and renders a component based on the retrieved data.
 * @param params - An object with a slug property of type string.
 * @returns The rendered component based on the retrieved data.
 */
export default async function Page({ params }) {
  const { apiUrl, contentType } = getStrapiApi(params.slug)
  const page = await fetchData(apiUrl)

  if (Array.isArray(page.data) && page.data.length === 0) return <ErrorPage />

  const pageData = Array.isArray(page.data)
    ? { id: page.data[0].id, ...page.data[0].attributes }
    : { id: page.data.id, ...page.data.attributes }

  return (
    <Content
      contentType={contentType}
      pageData={pageData}
    />
  )
}
