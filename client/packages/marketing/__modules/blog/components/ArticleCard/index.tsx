import Image from 'next/image'
import Link from 'next/link'
import { getStrapiMedia } from 'packages/global/utils/index'

const ArticleCard = ({ attributes }) => {
  const { slug, title, featuredImage, topic, author } = attributes

  return (
    <Link
      href={`/blog/${slug}`}
      className="text-secondary-darker inline-flex items-center">
      <div className="rounded-xl shadow-lg">
        <div className="relative">
          {featuredImage.data.attributes && (
            <Image
              alt={featuredImage.data.attributes.alternativeText || 'featured image'}
              src={getStrapiMedia(featuredImage.data.attributes.url)}
              height={366}
              width={366}
            />
          )}
          <span
            className="absolute bottom-0 py-1 px-2 
            font-medium tracking-widest 
            rounded bg-secondary-lightest text-secondary">
            {topic.data.attributes.name}
          </span>
        </div>
        <div className="px-8 py-6">
          <h2 className="sm:text-3xl text-2xl font-bold">{title}</h2>
          {author && author.data.attributes && (
            <div className="flex flex-row justify-between items-center mt-12">
              <span className=" ">by {author.data.attributes.name}</span>
              <Image
                alt={author.data.attributes.avatar.data.attributes.alternativeText || 'avatar'}
                src={getStrapiMedia(author.data.attributes.avatar.data.attributes.url)}
                height={36}
                width={36}
              />
            </div>
          )}
        </div>
      </div>
    </Link>
  )
}

export default ArticleCard
