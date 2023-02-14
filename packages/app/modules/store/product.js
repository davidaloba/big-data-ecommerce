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
          image={images}
          content={content}
          reviewa={reviews}
        />
        <RelatedProducts related={related} />
      </>
    </>
  )
}

export default Product
