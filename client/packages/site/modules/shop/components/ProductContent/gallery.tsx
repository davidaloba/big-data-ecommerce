import { getStrapiMedia } from '@siteUtils/index'

const Gallery = ({ images }) => {
  const responsive = {
    superLargeDesktop: {
      breakpoint: { max: 4000, min: 3000 },
      items: 5
    },
    desktop: {
      breakpoint: { max: 3000, min: 1024 },
      items: 3
    },
    tablet: {
      breakpoint: { max: 1024, min: 464 },
      items: 2
    },
    mobile: {
      breakpoint: { max: 464, min: 0 },
      items: 1
    }
  }
  return (
    <div>
      {images &&
        images.map((image, index) => (
          <img
            alt={image.attributes.alternativeText}
            className="block object-fill px-1"
            src={getStrapiMedia(image.attributes.url)}
            key={`imageGallery-${index}`}
          />
        ))}
    </div>
  )
}

export default Gallery
