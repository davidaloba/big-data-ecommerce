import dynamic from 'next/dynamic'

// @ts-expect-error TS(2345): Argument of type '() => Promise<typeof import("/ho... Remove this comment to see the full error message
const Article = dynamic(() => import('./blog/Article'), {
  ssr: true
})
const Articles = dynamic(() => import('./blog/Articles'), {
  ssr: true
})
// @ts-expect-error TS(2345): Argument of type '() => Promise<typeof import("/ho... Remove this comment to see the full error message
const Product = dynamic(() => import('./shop/product'), {
  ssr: true
})
const Products = dynamic(() => import('./shop/products'), {
  ssr: true
})

const ModuleManager = ({ modules, locale, perPage }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
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
          // @ts-expect-error TS(2749): 'Module' refers to a value, but is being used as a... Remove this comment to see the full error message
          <Module
            // @ts-expect-error TS(2304): Cannot find name 'key'.
            key={`index-${index}`}
            locale={locale}
            perPage={perPage}
            // @ts-expect-error TS(2304): Cannot find name 'rest'.
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
