import Image from 'next/image'
import Link from 'next/link'

import { getStrapiMedia } from '@globalUtils/index'

const BlogCard = ({ attributes: { slug, title, featuredImage, excerpt } }) => {
  return (
    <Link
      className="group"
      href={`/article/${slug}`}>
      <div className={` flex flex-col items-stretch px-0 pb-0 pt-0`}>
        <Image
          className=""
          src={getStrapiMedia(featuredImage.data.attributes.url)}
          alt="logo"
          width="1920"
          height="1024"
        />
        <div className="mt-4 md:mt-8 mx-8 index-card-margin  ">
          <div className={` group-hover:underline uppercase font-semibold `}>{title}S</div>
          <div className={`mt-1 md:mt-4  `}>{excerpt}</div>
        </div>
      </div>
    </Link>
  )
}

export default BlogCard
