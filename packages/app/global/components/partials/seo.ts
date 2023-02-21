import Head from 'next/head'

import { getStrapiMedia } from '@utils/index'

const Seo = ({ seo }) => {
  const {
    metaTitle,
    metaImage,
    metaRobots,
    metaSocial,
    structuredData,
    preventIndexing,
    metaDescription
  }: any = seo ? seo : {}

  const metaImageAttr = !seo
    ? {}
    : seo.metaImage
    ? seo.metaImage.data.attributes
    : {}

  // const metaTitle = seo.metaTitle
  // const metaRobots = seo.metaRobots
  // const metaSocial = seo.metaSocial
  // const structuredData = seo.structuredData
  // const preventIndexing = seo.preventIndexing
  // const metaDescription = seo.metaDescription

  return (
    // @ts-expect-error TS(2749): 'Head' refers to a value, but is being used as a t... Remove this comment to see the full error message
    <Head>
      // @ts-expect-error TS(2304): Cannot find name 'title'.
      <title>{metaTitle}</title>
      // @ts-expect-error TS(2304): Cannot find name 'meta'.
      <meta
        // @ts-expect-error TS(2588): Cannot assign to 'name' because it is a constant.
        name="description"
        // @ts-expect-error TS(2304): Cannot find name 'content'.
        content={metaDescription}
        // @ts-expect-error TS(2304): Cannot find name 'key'.
        key="description"
      />

      // @ts-expect-error TS(2304): Cannot find name 'meta'.
      <meta
        name="twitter:card"
        // @ts-expect-error TS(2304): Cannot find name 'content'.
        content="summary"
      />

      {metaSocial &&
        metaSocial.find((item) => item.socialNetwork == 'Twitter') && (
          <>
            // @ts-expect-error TS(2304): Cannot find name 'meta'.
            <meta
              // @ts-expect-error TS(2304): Cannot find name 'data'.
              data-hid="twitter:title"
              // @ts-expect-error TS(2588): Cannot assign to 'name' because it is a constant.
              name="twitter:title"
              // @ts-expect-error TS(2304): Cannot find name 'property'.
              property="twitter:title"
              // @ts-expect-error TS(2304): Cannot find name 'content'.
              content={item.title}
            />
            // @ts-expect-error TS(2304): Cannot find name 'meta'.
            <meta
              // @ts-expect-error TS(2304): Cannot find name 'data'.
              data-hid="twitter:description"
              // @ts-expect-error TS(2588): Cannot assign to 'name' because it is a constant.
              name="twitter:description"
              // @ts-expect-error TS(2304): Cannot find name 'property'.
              property="twitter:description"
              // @ts-expect-error TS(2304): Cannot find name 'content'.
              content={item.description}
            />
            // @ts-expect-error TS(2304): Cannot find name 'meta'.
            <meta
              // @ts-expect-error TS(2304): Cannot find name 'data'.
              data-hid="twitter:image"
              // @ts-expect-error TS(2588): Cannot assign to 'name' because it is a constant.
              name="twitter:image"
              // @ts-expect-error TS(2304): Cannot find name 'property'.
              property="twitter:image"
              // @ts-expect-error TS(2304): Cannot find name 'content'.
              content={getStrapiMedia(item.image.data.attributes.url)}
            />
            // @ts-expect-error TS(2304): Cannot find name 'meta'.
            <meta
              // @ts-expect-error TS(2304): Cannot find name 'data'.
              data-hid="twitter:image:alt"
              // @ts-expect-error TS(2588): Cannot assign to 'name' because it is a constant.
              name="twitter:image:alt"
              // @ts-expect-error TS(2304): Cannot find name 'property'.
              property="twitter:image:alt"
              // @ts-expect-error TS(2304): Cannot find name 'content'.
              content={item.image.data.attributes.alternativeText}
            />
          </>
        )}

      // @ts-expect-error TS(2304): Cannot find name 'meta'.
      <meta
        // @ts-expect-error TS(2304): Cannot find name 'prefix'.
        prefix="og: http://ogp.me/ns#"
        // @ts-expect-error TS(2304): Cannot find name 'data'.
        data-hid="og:title"
        // @ts-expect-error TS(2588): Cannot assign to 'name' because it is a constant.
        name="og:title"
        // @ts-expect-error TS(2304): Cannot find name 'property'.
        property="og:title"
        // @ts-expect-error TS(2304): Cannot find name 'content'.
        content={metaTitle}
      />
      // @ts-expect-error TS(2304): Cannot find name 'meta'.
      <meta
        // @ts-expect-error TS(2304): Cannot find name 'prefix'.
        prefix="og: http://ogp.me/ns#"
        // @ts-expect-error TS(2304): Cannot find name 'data'.
        data-hid="og:description"
        // @ts-expect-error TS(2588): Cannot assign to 'name' because it is a constant.
        name="og:description"
        // @ts-expect-error TS(2304): Cannot find name 'property'.
        property="og:description"
        // @ts-expect-error TS(2304): Cannot find name 'content'.
        content={metaDescription}
      />
      // @ts-expect-error TS(2304): Cannot find name 'meta'.
      <meta
        // @ts-expect-error TS(2304): Cannot find name 'prefix'.
        prefix="og: http://ogp.me/ns#"
        // @ts-expect-error TS(2304): Cannot find name 'data'.
        data-hid="og:image"
        // @ts-expect-error TS(2588): Cannot assign to 'name' because it is a constant.
        name="og:image"
        // @ts-expect-error TS(2304): Cannot find name 'property'.
        property="og:image"
        // @ts-expect-error TS(2304): Cannot find name 'content'.
        content={metaImageAttr.url}
      />
      // @ts-expect-error TS(2304): Cannot find name 'meta'.
      <meta
        // @ts-expect-error TS(2304): Cannot find name 'prefix'.
        prefix="og: http://ogp.me/ns#"
        // @ts-expect-error TS(2304): Cannot find name 'data'.
        data-hid="og:image:alt"
        // @ts-expect-error TS(2588): Cannot assign to 'name' because it is a constant.
        name="og:image:alt"
        // @ts-expect-error TS(2304): Cannot find name 'property'.
        property="og:image:alt"
        // @ts-expect-error TS(2304): Cannot find name 'content'.
        content={metaImageAttr.alternativeText}
      />

      // @ts-expect-error TS(2304): Cannot find name 'meta'.
      <meta
        name="robots"
        // @ts-expect-error TS(2304): Cannot find name 'content'.
        content={metaRobots}
      />

      // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
      {preventIndexing && !metaRobots.includes('noindex') && (
        <>
          // @ts-expect-error TS(2304): Cannot find name 'meta'.
          <meta
            name="robots"
            // @ts-expect-error TS(2304): Cannot find name 'content'.
            content="noindex"></meta>
          // @ts-expect-error TS(2304): Cannot find name 'meta'.
          <meta
            // @ts-expect-error TS(2588): Cannot assign to 'name' because it is a constant.
            name="googlebot"
            // @ts-expect-error TS(2304): Cannot find name 'content'.
            content="noindex"></meta>
        </>
      )}
      // @ts-expect-error TS(2304): Cannot find name 'script'.
      <script type="application/ld+json">{structuredData}</script>
    </Head>
  )
}

export default Seo
