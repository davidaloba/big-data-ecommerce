import ProductContent from './components/ProductContent'
import RelatedProducts from './components/RelatedProducts'

const Product = ({ name, category, place, images, content, reviews, related }) => {
  return (
    <>
      <>
        <ProductContent
          name={name}
          category={category}
          place={place}
          images={images}
          content={content}
          reviews={reviews}
        />
        <RelatedProducts related={related} />
      </>
    </>
  )
}

export default Product
