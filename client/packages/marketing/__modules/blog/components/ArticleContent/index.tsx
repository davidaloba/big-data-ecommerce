import Link from 'next/link'
import { getStrapiMedia } from 'packages/global/utils/index'
import RichContent from '@marketingComponents/__lib/RichContent'

const ArticleContent = ({ title, image, content }) => {
  const ckContent = content.ckeditor_content

  return (
    <div className="text-gray-600 body-font py-24">
      <div className="container px-5 py-2 mx-auto flex flex-col justify-center items-center">
        <h1 className="font-black sm:text-5xl text-4xl  mb-4 text-gray-900 text-center">{title}</h1>

        <div className="lg:w-4/6 mx-auto mt-10">
          <div className="shadow-lg rounded-lg overflow-hidden">
            <img
              alt={image.data.attributes.alternativeText}
              className="object-cover object-center h-full w-full"
              src={getStrapiMedia(image.data.attributes.url)}
            />
          </div>
          <div className="flex flex-col sm:flex-row mt-10 items-center justify-center"></div>
        </div>
        <div className="markdown-body ck-content shadow-lg rounded-xl lg:w-4/6 w-full md:p-12 p-6 mt-2 bg-white">
          <div className="border-none">
            <RichContent content={ckContent} />
          </div>
        </div>
        <Link href={`/blog`}>
          <button
            type="button"
            className="ml-2 py-4 mt-8 px-6 bg-secondary hover:bg-secondary-darker text-gray-50 w-1/8 text-center text-base font-semibold shadow-sm rounded-md">
            Back to articles
          </button>
        </Link>
      </div>
    </div>
  )
}

export default ArticleContent
