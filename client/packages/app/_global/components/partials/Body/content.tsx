import BlockManager from '@brochureComponents/BlockManager'
import Blog from '@blogComponents/Blog'
import Article from '@blogComponents/Article'
import Work from '@workComponents/Work'
import Project from '@workComponents/Project'
import Shop from '@shopComponents/Shop'
import Category from '@shopComponents/Category'
import Product from '@shopComponents/Product'
import Checkout from '@shopComponents/Checkout'
import Order from '@shopComponents/Order'

const componentMapping = {
  default: BlockManager,
  blog: Blog,
  work: Work,
  shop: Shop,
  articles: Article,
  projects: Project,
  products: Product,
  categories: Category,
  orders: Order,
  checkout: Checkout
}

interface ContentProps {
  contentType: string
  pageData: any // Update with the correct type for pageData
}

export default function Content({ contentType, pageData }: ContentProps) {
  const pageTID = pageData?.slug === 'home' ? pageData.slug : contentType

  const Content = componentMapping[pageTID] || componentMapping.default

  return <Content {...pageData} />
}
