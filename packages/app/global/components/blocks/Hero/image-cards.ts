import { getStrapiMedia } from '@utils/index'

const ImageCards = ({ images }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className="relative space-y-4">
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="flex items-end justify-center lg:justify-start space-x-4">
        {images &&
          images.data.slice(0, 2).map((image, index) => (
            // @ts-expect-error TS(2304): Cannot find name 'img'.
            <img
              // @ts-expect-error TS(2304): Cannot find name 'className'.
              className="rounded-lg shadow-lg w-32 md:w-56"
              // @ts-expect-error TS(2304): Cannot find name 'key'.
              key={`heroImage-${index}`}
              // @ts-expect-error TS(2304): Cannot find name 'width'.
              width="200"
              // @ts-expect-error TS(2304): Cannot find name 'src'.
              src={getStrapiMedia(image.attributes.url)}
              // @ts-expect-error TS(2304): Cannot find name 'alt'.
              alt={image.attributes.alternativeText}
            />
          ))}
      </div>
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="flex items-start justify-center lg:justify-start space-x-4 md:ml-12">
        // @ts-expect-error TS(2552): Cannot find name 'images'. Did you mean 'Image'?
        {images &&
          // @ts-expect-error TS(2552): Cannot find name 'images'. Did you mean 'Image'?
          images.data.slice(2, 4).map((image, index) => (
            // @ts-expect-error TS(2304): Cannot find name 'img'.
            <img
              // @ts-expect-error TS(2304): Cannot find name 'className'.
              className="rounded-lg shadow-lg w-32 md:w-56"
              // @ts-expect-error TS(2304): Cannot find name 'key'.
              key={`heroImage-${index}`}
              // @ts-expect-error TS(2304): Cannot find name 'width'.
              width="200"
              // @ts-expect-error TS(2304): Cannot find name 'src'.
              src={getStrapiMedia(image.attributes.url)}
              // @ts-expect-error TS(2304): Cannot find name 'alt'.
              alt={image.attributes.alternativeText}
            />
          ))}
      </div>
    </div>
  )
}

ImageCards.defaultProps = {}

export default ImageCards
