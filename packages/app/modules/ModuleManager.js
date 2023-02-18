import dynamic from 'next/dynamic'

const Article = dynamic(() => import('./blog/Article'), {
  ssr: true
})
const Articles = dynamic(() => import('./blog/Articles'), {
  ssr: true
})
const Product = dynamic(() => import('./shop/product'), {
  ssr: true
})
const Products = dynamic(() => import('./shop/products'), {
  ssr: true
})

const ModuleManager = ({ modules, locale, perPage }) => {
  return (
    <div>
      {modules.map((module, index) => {
        const { __component, ...rest } = module

        let Module
        switch (__component) {
          case 'modules.article':
            Module = Article
            break
          case 'modules.articles':
            Module = Articles
            break
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
            locale={locale}
            perPage={perPage}
            {...rest}
          />
        ) : null
      })}
    </div>
  )
}

ModuleManager.defaultProps = {
  modules: []
}

export default ModuleManager
