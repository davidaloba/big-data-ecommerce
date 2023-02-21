import Container from '@components/__lib/Container'
import { getStrapiMedia } from '@utils/index'

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
    // @ts-expect-error TS(2709): Cannot use namespace 'Container' as a type.
    <Container
      // @ts-expect-error TS(2304): Cannot find name 'swipeable'.
      swipeable={false}
      // @ts-expect-error TS(2304): Cannot find name 'draggable'.
      draggable={false}
      // @ts-expect-error TS(2304): Cannot find name 'showDots'.
      showDots={true}
      // @ts-expect-error TS(2588): Cannot assign to 'responsive' because it is a cons... Remove this comment to see the full error message
      responsive={responsive}
      // @ts-expect-error TS(2304): Cannot find name 'ssr'.
      ssr={true}
      // @ts-expect-error TS(2552): Cannot find name 'infinite'. Did you mean 'isFinit... Remove this comment to see the full error message
      infinite={true}
      // @ts-expect-error TS(2304): Cannot find name 'keyBoardControl'.
      keyBoardControl={true}
      // @ts-expect-error TS(2304): Cannot find name 'customTransition'.
      customTransition="all .5"
      // @ts-expect-error TS(2304): Cannot find name 'transitionDuration'.
      transitionDuration={100}
      // @ts-expect-error TS(2304): Cannot find name 'containerClass'.
      containerClass="carousel-container"
      // @ts-expect-error TS(2304): Cannot find name 'dotListClass'.
      dotListClass="custom-dot-list-style"
      // @ts-expect-error TS(2304): Cannot find name 'itemClass'.
      itemClass="md:py-2 py-2 w-1/2">
      {images &&
        images.map((image, index) => (
          // @ts-expect-error TS(2304): Cannot find name 'img'.
          <img
            // @ts-expect-error TS(2304): Cannot find name 'alt'.
            alt={image.attributes.alternativeText}
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className="block object-fill px-1"
            // @ts-expect-error TS(2304): Cannot find name 'src'.
            src={getStrapiMedia(image.attributes.url)}
            // @ts-expect-error TS(2304): Cannot find name 'key'.
            key={`imageGallery-${index}`}
          />
        ))}
    </Container>
  )
}

export default Gallery
