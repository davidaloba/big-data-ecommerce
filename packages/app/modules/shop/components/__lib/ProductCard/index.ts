import Link from 'next/link'
import { getStrapiMedia } from '@utils/index'

const ProductCard = ({ slug, main, locale }) => {
  const { images, name, information, category, tag } = main[0]
  const tagName = tag && tag.data ? tag.data.attributes.name : ''
  const categoryName = category && category.data ? category.data.attributes.name : ''
  const description = information ? information.description : ''
  return (
    // @ts-expect-error TS(2749): 'Link' refers to a value, but is being used as a t... Remove this comment to see the full error message
    <Link href={`shop/${slug}?lang=${locale}`}>
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="overflow-hidden shadow-lg rounded-lg h-90 w-full cursor-pointer">
        // @ts-expect-error TS(2304): Cannot find name 'img'.
        <img
          // @ts-expect-error TS(2304): Cannot find name 'alt'.
          alt={images.data[0].attributes.alternativeText}
          // @ts-expect-error TS(2304): Cannot find name 'src'.
          src={getStrapiMedia(images.data[0].attributes.url)}
          // @ts-expect-error TS(2304): Cannot find name 'className'.
          className="max-h-48 w-full object-cover"
        />
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="bg-white w-full p-4">
          // @ts-expect-error TS(2304): Cannot find name 'p'.
          <p className="text-secondary text-md font-medium">{tagName}</p>
          // @ts-expect-error TS(1345): An expression of type 'void' cannot be tested for ... Remove this comment to see the full error message
          {name && <p className="text-gray-800 text-xl font-medium mb-2">{name}</p>}

          // @ts-expect-error TS(2304): Cannot find name 'description'.
          {description && <p className="text-gray-400 font-light text-md">{description}</p>}

          // @ts-expect-error TS(2304): Cannot find name 'categoryName'.
          {categoryName && (
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="flex flex-wrap justify-starts items-center mt-4">
              // @ts-expect-error TS(2304): Cannot find name 'div'.
              <div className="text-xs mr-2 py-1.5 px-4 text-gray-600 bg-blue-100 rounded-2xl">
                // @ts-expect-error TS(2304): Cannot find name 'categoryName'.
                #{categoryName}
              </div>
            </div>
          )}
        // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
        </div>
      </div>
    </Link>
  )
}

export default ProductCard
