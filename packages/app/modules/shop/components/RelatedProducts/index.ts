import ProductCard from '../__lib/ProductCard'
import Container from '@components/__lib/Container'
import Header from '@components/__lib/Header'

const RelatedProducts = ({ related }) => {
  const { header, products } = related
  return (
    // @ts-expect-error TS(2709): Cannot use namespace 'Container' as a type.
    <Container>
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="bg-gray-100 my-40">
        // @ts-expect-error TS(2749): 'Header' refers to a value, but is being used as a... Remove this comment to see the full error message
        <Header {...header} />
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="w-4/5 mx-auto py-16 ">
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="grid md:grid-cols-3 sm:grid-cols-2 grid-cols-1 gap-4 pt-12 pb-12 px-4">
            {products &&
              products.data.map((product, index) => (
                // @ts-expect-error TS(2749): 'ProductCard' refers to a value, but is being used... Remove this comment to see the full error message
                <ProductCard
                  {...product.attributes}
                  // @ts-expect-error TS(2304): Cannot find name 'key'.
                  key={index}
                />
              ))}
          // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
          </div>
        </div>
      </div>
    </Container>
  )
}

RelatedProducts.defaultProps = {}

export default RelatedProducts
