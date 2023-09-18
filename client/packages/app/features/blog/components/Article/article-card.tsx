import Image from 'next/image'
import Link from 'next/link'
import { getStrapiMedia } from '@globalUtils/index'

const ArticleCard = ({ attributes: { slug, title, featuredImage, excerpt, topic } }) => {
  return (
    <Link
      href={`/article/${slug}`}
      className="text-secondary-darker inline-flex items-center">
      <div className=" shadow-lg">
        <div className="relative">
          {featuredImage.data.attributes && (
            <Image
              alt={featuredImage.data.attributes.alternativeText || 'featured image'}
              src={getStrapiMedia(featuredImage.data.attributes.url)}
              height={366}
              width={366}
            />
          )}
          {topic && topic.data && (
            <span
              className="absolute bottom-0 py-1 px-2 
                font-medium tracking-widest 
                uppercase bg-secondary-lightest text-secondary">
              {topic.data.attributes.name}
            </span>
          )}
        </div>
        <div className="px-8 py-6">
          <h2 className=" uppercase font-semibold">{title}</h2>
          <p className=" mt-4">{excerpt}</p>
        </div>
      </div>
    </Link>
  )
}

export default ArticleCard
