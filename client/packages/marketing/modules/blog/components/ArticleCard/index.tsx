import Link from 'next/link'
import { getStrapiMedia } from '@marketingUtils/index'

const ArticleCard = ({ slug, main, seo }) => {
  const { title, category, author, image } = main[0]

  const description = seo ? seo.metaDescription : ''
  const authorAttr = author ? author.data.attributes : ''
  const categoryAttr = author ? category.data.attributes : ''

  return (
    <div>
      <span className="inline-block py-2 px-2 rounded bg-secondary-lightest text-secondary text-xs font-medium tracking-widest">
        {categoryAttr.name}
      </span>
      <img
        alt={image.data.attributes.alternativeText}
        src={getStrapiMedia(image.data.attributes.url)}
        className="max-h-48 w-full py-3 object-cover"
      />
      <h2 className="sm:text-3xl text-2xl title-font font-medium text-gray-900 mt-4 mb-4">
        {title}
      </h2>
      <p className="leading-relaxed mb-8">{description}</p>
      <div className="flex items-center flex-wrap pb-4 mb-4 border-b-2 border-gray-100 mt-auto w-full">
        <Link
          href={`/blog/${slug}`}
          className="text-secondary-darker inline-flex items-center">
          Learn More
          <svg
            className="w-4 h-4 ml-2"
            viewBox="0 0 24 24"
            stroke="currentColor"
            strokeWidth="2"
            fill="none"
            strokeLinecap="round"
            strokeLinejoin="round">
            <path d="M5 12h14"></path>
            <path d="M12 5l7 7-7 7"></path>
          </svg>
        </Link>
      </div>
      {authorAttr.picture && (
        <div className="inline-flex items-center">
          <img
            alt={authorAttr.picture.alternativeText}
            src={getStrapiMedia(authorAttr.picture.url)}
            className="w-12 h-12 rounded-full flex-shrink-0 object-cover object-center"
          />
          <span className="flex-grow flex flex-col pl-4">
            <span className="title-font font-medium text-gray-900">{authorAttr.username}</span>
            <span className="text-gray-400 text-xs tracking-widest mt-0.5">{authorAttr.job}</span>
          </span>
        </div>
      )}
    </div>
  )
}

export default ArticleCard
