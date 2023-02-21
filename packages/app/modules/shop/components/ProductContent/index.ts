import Link from 'next/link'
import { getStrapiMedia } from '@utils/index'
import Container from '@components/__lib/Container'
import SocialLogo from '@components/__lib/SocialLogo'
import Information from './information'
import OpeningHours from './opening-hours'
import Price from './price'
import Gallery from './gallery.js'
import ReviewSummary from './Reviews/review-summary'
import OverallRating from './Reviews/overall-rating'
import Reviews from './Reviews/reviews'
import Stars from './stars'

const ProductContent = ({ name, category, tag, images, content, reviews: reviewsData, locale }) => {
  const price = content.price
  const socialNetworks = content.socialNetworks
  const information = content.information
  const reviews = reviewsData.reviews.data

  const description = information.description
  const opening_hours = information.opening_hours
  const location = information.location

  return (
    // @ts-expect-error TS(2709): Cannot use namespace 'Container' as a type.
    <Container>
      // @ts-expect-error TS(2304): Cannot find name 'section'.
      <section className="text-gray-600 body-font overflow-hidden mt-40">
        // @ts-expect-error TS(2749): 'Link' refers to a value, but is being used as a t... Remove this comment to see the full error message
        <Link href={`shop?lang=${locale}`}>
          // @ts-expect-error TS(2304): Cannot find name 'button'.
          <button
            // @ts-expect-error TS(2304): Cannot find name 'type'.
            type="button"
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className="ml-2 py-4 px-6 bg-secondary hover:bg-secondary-darker text-white w-1/8 text-center text-base font-semibold shadow-sm rounded-md">
            // @ts-expect-error TS(2304): Cannot find name 'svg'.
            <svg
              // @ts-expect-error TS(2304): Cannot find name 'xmlns'.
              xmlns="http://www.w3.org/2000/svg"
              // @ts-expect-error TS(2304): Cannot find name 'className'.
              className="h-6 w-6"
              // @ts-expect-error TS(2304): Cannot find name 'fill'.
              fill="none"
              // @ts-expect-error TS(2304): Cannot find name 'viewBox'.
              viewBox="0 0 24 24"
              // @ts-expect-error TS(2304): Cannot find name 'stroke'.
              stroke="currentColor">
              // @ts-expect-error TS(2304): Cannot find name 'path'.
              <path
                // @ts-expect-error TS(2304): Cannot find name 'strokeLinecap'.
                strokeLinecap="round"
                // @ts-expect-error TS(2304): Cannot find name 'strokeLinejoin'.
                strokeLinejoin="round"
                // @ts-expect-error TS(2304): Cannot find name 'strokeWidth'.
                strokeWidth={2}
                // @ts-expect-error TS(2304): Cannot find name 'd'.
                d="M7 16l-4-4m0 0l4-4m-4 4h18"
              />
            </svg>
          </button>
        </Link>
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="mx-auto md:flex md:flex-wrap">
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="lg:flex lg:flex-wrap w-full lg:w-1/2">
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="p-2 md:w-full">
              // @ts-expect-error TS(2304): Cannot find name 'img'.
              <img
                // @ts-expect-error TS(2304): Cannot find name 'alt'.
                alt={images.data[0].attributes.alternativeText}
                // @ts-expect-error TS(2304): Cannot find name 'className'.
                className="object-center block object-cover"
                // @ts-expect-error TS(2304): Cannot find name 'src'.
                src={getStrapiMedia(images.data[0].attributes.url)}
              />
              // @ts-expect-error TS(2749): 'Gallery' refers to a value, but is being used as ... Remove this comment to see the full error message
              <Gallery images={images.data} />
            </div>
          </div>
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="lg:w-1/2 w-full lg:pl-10 lg:py-6 mt-6 lg:mt-0 p-4">
            {category.data && (
              // @ts-expect-error TS(2304): Cannot find name 'h2'.
              <h2 className="text-sm title-font text-gray-500 tracking-widest">
                {category.data.attributes.name}
              </h2>
            )}
            // @ts-expect-error TS(1345): An expression of type 'void' cannot be tested for ... Remove this comment to see the full error message
            {name && <h1 className="text-gray-900 text-3xl title-font font-medium mb-1">{name}</h1>}
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="flex mb-4">
              // @ts-expect-error TS(2304): Cannot find name 'span'.
              <span className="flex items-center">
                // @ts-expect-error TS(2749): 'Stars' refers to a value, but is being used as a ... Remove this comment to see the full error message
                <Stars reviews={reviews} />
                // @ts-expect-error TS(2304): Cannot find name 'reviews'.
                <ReviewSummary reviews={reviews} />
              </span>

              // @ts-expect-error TS(2304): Cannot find name 'span'.
              <span className="flex ml-3 pl-3 py-2 border-l-2 border-gray-200 space-x-2s">
                // @ts-expect-error TS(2749): 'Price' refers to a value, but is being used as a ... Remove this comment to see the full error message
                <Price price={price} />
              </span>

              // @ts-expect-error TS(2304): Cannot find name 'span'.
              <span className="flex ml-3 pl-3 py-2 border-l-2 border-gray-200 space-x-2s">
                // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
                {socialNetworks &&
                  // @ts-expect-error TS(2304): Cannot find name 'socialNetworks'.
                  socialNetworks.map((network, index) => (
                    // @ts-expect-error TS(2709): Cannot use namespace 'SocialLogo' as a type.
                    <SocialLogo
                      // @ts-expect-error TS(2304): Cannot find name 'url'.
                      url={network.url}
                      // @ts-expect-error TS(2304): Cannot find name 'size'.
                      size="20"
                      // @ts-expect-error TS(2304): Cannot find name 'key'.
                      key={index}
                    />
                  ))}
              </span>
            </div>

            // @ts-expect-error TS(2304): Cannot find name 'description'.
            {description && <p className="leading-relaxed mb-10">{description}</p>}

            // @ts-expect-error TS(2304): Cannot find name 'opening_hours'.
            <OpeningHours opening_hours={opening_hours} />
            // @ts-expect-error TS(2749): 'Information' refers to a value, but is being used... Remove this comment to see the full error message
            <Information information={information} />
          </div>
        </div>
      </section>
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="text-center pt-40">
        // @ts-expect-error TS(2304): Cannot find name 'p'.
        <p className="mt-2 text-3xl leading-8 font-extrabold tracking-tight text-gray-900 sm:text-4xl">
          Reviews
        </p>
      </div>
      // @ts-expect-error TS(2304): Cannot find name 'reviews'.
      {reviews && (
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="md:grid md:grid-cols-2 gap-4 mt-20">
          // @ts-expect-error TS(2749): 'OverallRating' refers to a value, but is being us... Remove this comment to see the full error message
          <OverallRating reviews={reviews} />
          // @ts-expect-error TS(2304): Cannot find name 'reviews'.
          <Reviews reviews={reviews} />
        </div>
      )}
    </Container>
  )
}

ProductContent.defaultProps = {}

export default ProductContent
