import ProductContent from './components/blocks/ProductContent'
import BlockManager from './components/blocks/BlockManager'

const Product = ({ ...pageData }) => {
  const blocks = pageData.pageData.attributes.blocks
  return (
    <>
      <>
        <ProductContent pageData={{ ...pageData }} />
        {blocks && <BlockManager blocks={blocks} />}
      </>
    </>
  )
}

export default Product
