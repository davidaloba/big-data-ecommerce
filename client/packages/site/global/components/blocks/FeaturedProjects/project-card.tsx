import { getStrapiMedia } from '@siteUtils/index'
import React from 'react'

export default function ProjectCard({ title, slug, image, label, text }) {
  const imageSrc = getStrapiMedia(image.data.attributes.url)
  const imageAlt = image.data.attributes.alternativeText

  return (
    <a
      href={slug}
      className="w-full block shadow-2xl col-span-1 cursor-pointer ">
      <div className="relative overflow-hidden rounded-lg ">
        <img
          src={imageSrc}
          alt={imageAlt}
          className="transform hover:scale-125 transition duration-2000 ease-out"
        />
        <h1 className="absolute top-3 xl:top-5 left-3 xl:left-5 md:text-xl text-gray-50 font-bold bg-orange-600 rounded-md px-2">
          {title}
        </h1>
        <h1 className="absolute bottom-2 xl:bottom-5 left-3 xl:left-5 text-sm md:text-lg text-gray-500 bg-[#f1f1f1] rounded-md px-2">
          {label}
        </h1>
      </div>
    </a>
  )
}
