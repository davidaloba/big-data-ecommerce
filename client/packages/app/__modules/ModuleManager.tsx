import dynamic from 'next/dynamic'

const Product = dynamic(() => import('./shop/components/Product'), {
  ssr: true
})
const Products = dynamic(() => import('./shop/components/Products'), {
  ssr: true
})

const ModuleManager = ({ modules, perPage }) => {
  return (
    <div>
      {modules.map((module, index) => {
        const { __component, ...rest } = module

        let Module
        switch (__component) {
          case 'modules.product':
            Module = Product
            break
          case 'modules.products':
            Module = Products
            break
        }

        return Module ? (
          <Module
            key={`index-${index}`}
            perPage={perPage}
            {...rest}
          />
        ) : null
      })}
    </div>
  )
}

export default ModuleManager
