import dynamic from 'next/dynamic'

const Categories = dynamic(() => import('@appModules/shop/components/Categories'), {
  ssr: true
})
const Category = dynamic(() => import('@appModules/shop/components/Category'), {
  ssr: true
})
const Product = dynamic(() => import('@appModules/shop/components/Product'), {
  ssr: true
})
const Shop = dynamic(() => import('@appModules/shop/components/Shop'), {
  ssr: true
})

const BlockManager = ({ blocks, perPage }) => {
  return (
    <div>
      {blocks.map(({ __component, ...rest }, index) => {
        let Block

        switch (__component) {
          case 'shop.categories':
            Block = Categories
            break
          case 'shop.category':
            Block = Category
            break
          case 'shop.product':
            Block = Product
            break
          case 'shop.shop':
            Block = Shop
            break
        }
        return Block ? (
          <Block
            key={`index-${index}`}
            perPage={perPage}
            {...rest}
          />
        ) : null
      })}
    </div>
  )
}

export default BlockManager
