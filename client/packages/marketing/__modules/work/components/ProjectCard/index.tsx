import Link from 'next/link'
import { getStrapiMedia } from 'packages/global/utils/index'
import Header from '@marketingComponents/__lib/Header'
import Image from 'next/image'

const ProjectCard = ({ slug, main }) => {
  const { header, image } = main[0]

  const imageSrc = getStrapiMedia(image.data.attributes.url)
  const imageAlt = image.data.attributes.alternativeText

  return (
    <div>
      <Header {...header} />
      <div className="!relative mt-12 md:mt-20 mx-12  w-fit h-fit object-contain  rounded-lg">
        <Image
          src={imageSrc}
          alt={imageAlt}
          fill
        />
      </div>
    </div>
  )
}

export default ProjectCard
