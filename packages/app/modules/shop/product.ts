import ProductContent from './components/ProductContent'
import RelatedProducts from './components/RelatedProducts'

const Product = ({ name, category, tag, images, content, reviews, related, locale }) => {
  return (
    <>
      <>
        // @ts-expect-error TS(2709): Cannot use namespace 'ProductContent' as a type.
        <ProductContent
          name={name}
          category={category}
          tag={tag}
          images={images}
          content={content}
          reviews={reviews}
          locale
        />
        // @ts-expect-error TS(2709): Cannot use namespace 'RelatedProducts' as a type.
        <RelatedProducts related={related} />
      </>
    </>
  )
}

export default Product
