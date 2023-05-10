import Image from 'next/image'
import Link from 'next/link'
import { getStrapiMedia } from 'packages/global/utils/index'

const ArticleCard = ({ attributes }) => {
  const { slug, cardImage, logo, description, bgColor } = attributes
  // TODO: ADD DYNAMIC BG-COLOR
  // TODO: FIX CARD HEIGHT ISSUE

  return (
    <Link
      href={`/work/${slug}`}
      className={`relative group grid h-[276px] hover:bg-[#50d71e]/50`}>
      <div className="p-4 self-center flex flex-col items-center justify-center ">
        <Image
          alt={logo.data.attributes.alternativeText || 'avatar'}
          src={getStrapiMedia(logo.data.attributes.url)}
          height={30}
          width={80}
        />
        <p className="hidden group-hover:block mt-4  font-semibold text-white text-center ">
          {description}
        </p>
      </div>
      <Image
        className="absolute top-0 -z-10"
        alt={cardImage.data.attributes.alternativeText || 'featured image'}
        src={getStrapiMedia(cardImage.data.attributes.url)}
        height={386}
        width={386}
      />
    </Link>
  )
}

export default ArticleCard
