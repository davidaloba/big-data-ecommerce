import Link from 'next/link'
import { getStrapiMedia } from 'packages/global/utils/index'

const ProductCard = ({ slug, main }) => {
  const { images, name, information, category, tag } = main[0]
  const tagName = tag && tag.data ? tag.data.attributes.name : ''
  const categoryName = category && category.data ? category.data.attributes.name : ''
  const description = information ? information.description : ''
  return (
    <Link href={`shop/${slug}`}>
      <div className="overflow-hidden shadow-lg rounded-lg h-90 w-full cursor-pointer">
        <img
          alt={images.data[0].attributes.alternativeText}
          src={getStrapiMedia(images.data[0].attributes.url)}
          className="max-h-48 w-full object-cover"
        />
        <div className="bg-white w-full p-4">
          <p className="text-secondary text-md font-medium">{tagName}</p>
          {name && <p className="text-gray-800 text-xl font-medium mb-2">{name}</p>}

          {description && <p className="text-gray-400 font-light text-md">{description}</p>}

          {categoryName && (
            <div className="flex flex-wrap justify-starts items-center mt-4">
              <div className="text-xs mr-2 py-1.5 px-4 text-gray-600 bg-blue-100 rounded-2xl">
                #{categoryName}
              </div>
            </div>
          )}
        </div>
      </div>
    </Link>
  )
}

export default ProductCard
