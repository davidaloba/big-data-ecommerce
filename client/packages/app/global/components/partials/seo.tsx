import Head from 'next/head'

import { getStrapiMedia } from '@globalUtils/index'

const Seo = ({
  seo: {
    metaTitle,
    metaImage,
    metaRobots,
    metaSocial,
    structuredData,
    preventIndexing,
    metaDescription
  }
}) => {
  return (
    <Head>
      <title>{metaTitle}</title>
      <meta
        name="description"
        content={metaDescription}
        key="description"
      />

      <meta
        name="twitter:card"
        content="summary"
      />

      {metaSocial && metaSocial.find((item) => item.socialNetwork == 'Twitter') && (
        <>
          <meta
            data-hid="twitter:title"
            name="twitter:title"
            property="twitter:title"
            content={item.title}
          />
          <meta
            data-hid="twitter:description"
            name="twitter:description"
            property="twitter:description"
            content={item.description}
          />
          <meta
            data-hid="twitter:image"
            name="twitter:image"
            property="twitter:image"
            content={getStrapiMedia(item.image.data.attributes.url)}
          />
          <meta
            data-hid="twitter:image:alt"
            name="twitter:image:alt"
            property="twitter:image:alt"
            content={item.image.data.attributes.alternativeText}
          />
        </>
      )}

      <meta
        prefix="og: http://ogp.me/ns#"
        data-hid="og:title"
        name="og:title"
        property="og:title"
        content={metaTitle}
      />
      <meta
        prefix="og: http://ogp.me/ns#"
        data-hid="og:description"
        name="og:description"
        property="og:description"
        content={metaDescription}
      />
      <meta
        prefix="og: http://ogp.me/ns#"
        data-hid="og:image"
        name="og:image"
        property="og:image"
        content={metaImage.data.attributes.url}
      />
      <meta
        prefix="og: http://ogp.me/ns#"
        data-hid="og:image:alt"
        name="og:image:alt"
        property="og:image:alt"
        content={metaImage.data.attributes.alternativeText}
      />

      <meta
        name="robots"
        content={metaRobots}
      />

      {preventIndexing && !metaRobots.includes('noindex') && (
        <>
          <meta
            name="robots"
            content="noindex"></meta>
          <meta
            name="googlebot"
            content="noindex"></meta>
        </>
      )}
      <script type="application/ld+json">{structuredData}</script>
    </Head>
  )
}

export default Seo
