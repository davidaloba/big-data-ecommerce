import Link from 'next/link'
import { getStrapiMedia } from '@utils/index'

const ArticleCard = ({ slug, main, seo, locale }) => {
  const { title, category, author, image } = main[0]

  const description = seo ? seo.metaDescription : ''
  const authorAttr = author ? author.data.attributes : ''
  const categoryAttr = author ? category.data.attributes : ''

  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div>
      // @ts-expect-error TS(2304): Cannot find name 'span'.
      <span className="inline-block py-2 px-2 rounded bg-secondary-lightest text-secondary text-xs font-medium tracking-widest">
        {categoryAttr.name}
      </span>
      // @ts-expect-error TS(2304): Cannot find name 'img'.
      <img
        // @ts-expect-error TS(2304): Cannot find name 'alt'.
        alt={image.data.attributes.alternativeText}
        // @ts-expect-error TS(2304): Cannot find name 'src'.
        src={getStrapiMedia(image.data.attributes.url)}
        // @ts-expect-error TS(2304): Cannot find name 'className'.
        className="max-h-48 w-full py-3 object-cover"
      />
      // @ts-expect-error TS(2304): Cannot find name 'h2'.
      <h2 className="sm:text-3xl text-2xl title-font font-medium text-gray-900 mt-4 mb-4">
        {title}
      </h2>
      // @ts-expect-error TS(2304): Cannot find name 'p'.
      <p className="leading-relaxed mb-8">{description}</p>
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="flex items-center flex-wrap pb-4 mb-4 border-b-2 border-gray-100 mt-auto w-full">
        // @ts-expect-error TS(2749): 'Link' refers to a value, but is being used as a t... Remove this comment to see the full error message
        <Link
          // @ts-expect-error TS(2304): Cannot find name 'href'.
          href={`/blog/${slug}?lang=${locale}`}
          // @ts-expect-error TS(2304): Cannot find name 'className'.
          className="text-secondary-darker inline-flex items-center">
          // @ts-expect-error TS(2304): Cannot find name 'Learn'.
          Learn More
          // @ts-expect-error TS(2304): Cannot find name 'svg'.
          <svg
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className="w-4 h-4 ml-2"
            // @ts-expect-error TS(2304): Cannot find name 'viewBox'.
            viewBox="0 0 24 24"
            // @ts-expect-error TS(2304): Cannot find name 'stroke'.
            stroke="currentColor"
            // @ts-expect-error TS(2304): Cannot find name 'strokeWidth'.
            strokeWidth="2"
            // @ts-expect-error TS(2304): Cannot find name 'fill'.
            fill="none"
            // @ts-expect-error TS(2304): Cannot find name 'strokeLinecap'.
            strokeLinecap="round"
            // @ts-expect-error TS(2304): Cannot find name 'strokeLinejoin'.
            strokeLinejoin="round">
            // @ts-expect-error TS(2304): Cannot find name 'path'.
            <path d="M5 12h14"></path>
            // @ts-expect-error TS(2304): Cannot find name 'path'.
            <path d="M12 5l7 7-7 7"></path>
          </svg>
        </Link>
      </div>
      {authorAttr.picture && (
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="inline-flex items-center">
          // @ts-expect-error TS(2304): Cannot find name 'img'.
          <img
            // @ts-expect-error TS(2304): Cannot find name 'alt'.
            alt={authorAttr.picture.alternativeText}
            // @ts-expect-error TS(2304): Cannot find name 'src'.
            src={getStrapiMedia(authorAttr.picture.url)}
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className="w-12 h-12 rounded-full flex-shrink-0 object-cover object-center"
          />
          // @ts-expect-error TS(2304): Cannot find name 'span'.
          <span className="flex-grow flex flex-col pl-4">
            // @ts-expect-error TS(2304): Cannot find name 'span'.
            <span className="title-font font-medium text-gray-900">{authorAttr.username}</span>
            // @ts-expect-error TS(2304): Cannot find name 'span'.
            <span className="text-gray-400 text-xs tracking-widest mt-0.5">{authorAttr.job}</span>
          </span>
        </div>
      )}
    </div>
  )
}

export default ArticleCard
