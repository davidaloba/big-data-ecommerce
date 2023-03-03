import { getStrapiMedia } from '@utils/index'
import React from 'react'

export default function ProjectCard({ title, slug, image, label, text }) {
  const imageSrc = getStrapiMedia(image.data.attributes.url)
  const imageAlt = image.data.attributes.alternativeText

  return (
    <a
      href={slug}
      className="w-full block col-span-3 shadow-2xl">
      <div className="relative overflow-hidden">
        <img
          src={imageSrc}
          alt={imageAlt}
          className="transform hover:scale-125 transition duration-2000 ease-out"
        />
        <h1 className="absolute top-10 left-10 text-gray-50 font-bold text-xl bg-blue-900 rounded-md px-2">
          {title}
        </h1>
        <h1 className="absolute bottom-10 left-10 text-gray-50 font-bold text-xl">{label}</h1>
      </div>
    </a>
  )
}
