import ProductCard from '../ProductCard'
import Header from '@marketingComponents/__lib/Header'

const RelatedProducts = ({ related }) => {
  const { header, products } = related
  return (
    <div className="bg-gray-100 my-40">
      <Header {...header} />
      <div className="w-4/5 mx-auto py-16 ">
        <div className="grid md:grid-cols-3 sm:grid-cols-2 grid-cols-1 gap-4 pt-12 pb-12 px-4">
          {products &&
            products.data.map((product, index) => (
              <ProductCard
                {...product.attributes}
                key={index}
              />
            ))}
        </div>
      </div>
    </div>
  )
}

export default RelatedProducts
