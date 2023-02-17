import ProductContent from './components/ProductContent'
import RelatedProducts from './components/RelatedProducts'

const Product = ({ name, category, tag, images, content, reviews, related }) => {
  return (
    <>
      <>
        <ProductContent
          name={name}
          category={category}
          tag={tag}
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
