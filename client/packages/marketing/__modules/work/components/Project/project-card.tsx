import Image from 'next/image'
import Link from 'next/link'
import { getStrapiMedia } from 'packages/global/utils/index'

const ProjectCard = ({ attributes: { slug, title, featuredImage, description, kind } }) => {
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
          {kind && kind.data && (
            <span
              className="absolute bottom-0 py-1 px-2 
                font-medium tracking-widest 
                uppercase bg-secondary-lightest text-secondary">
              {kind.data.attributes.name}
            </span>
          )}
        </div>
        <div className="px-8 py-6">
          <h2 className=" uppercase font-semibold">{title}</h2>
          <p className=" mt-4">{description}</p>
        </div>
      </div>
    </Link>
  )
}

export default ProjectCard
