import { useState } from 'react'
import { getStrapiMedia } from 'packages/global/utils/index'
import Link from 'next/link'
import Image from 'next/image'

const Project = ({ title, featuredImage, mockup, content }) => {
  //TODO: project navigation
  const [pageNumber, setPageNumber] = useState(1)
  const createMarkup = () => {
    return { __html: content }
  }

  return (
    <>
      <section className="relative text-gray-600 body-font py-24">
        <Image
          alt={title}
          className="absolute top-0 left-0 -z-10 object-cover object-center"
          src={getStrapiMedia(featuredImage.data.attributes.url)}
          width={1366}
          height={1366}
        />
        <p className="text-center text-white">Case Study</p>
        <h1 className="font-black sm:text-5xl text-4xl mt-10 mb-4 text-white text-center">
          {title}
        </h1>
        <Image
          alt={title}
          className="object-cover object-center"
          src={getStrapiMedia(mockup.data.attributes.url)}
          width={1366}
          height={1366}
        />
        <div
          className="editor mt-10"
          dangerouslySetInnerHTML={createMarkup()}></div>
        <div className="mt-10 grid grid-cols-5  ">
          <div className="col-start-2 col-end-5 flex items-center">
            <button
              type="button"
              className={`w-full p-4 border ase rounded-l-xl text-gray-600 bg-white hover:bg-gray-100 focus:outline-none`}>
              Previous Case Study
            </button>
            <button
              type="button"
              className={` w-full p-4 border-t border-b border-r ase rounded-r-xl text-gray-600 bg-white hover:bg-gray-100 focus:outline-none`}
              onClick={() => setPageNumber(pageNumber + 1)}>
              Next Case Study
            </button>
          </div>
        </div>
      </section>
    </>
  )
}

export default Project
