import ProductContent from './components/ProductContent'
import RelatedProducts from './components/RelatedProducts'

const Product = ({ ...pageData }) => {
  return (
    <>
      <>
        <ProductContent {...pageData} />
        <RelatedProducts {...pageData} />
      </>
    </>
  )
}

export default Product
