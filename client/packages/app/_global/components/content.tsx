import BlockManager from '@pagesComponents/BlockManager'
import Blog from '@blogComponents/Blog'
import Article from '@blogComponents/Article'
import Work from '@workComponents/Work'
import Project from '@workComponents/Project'
import Shop from '@shopComponents/Shop'
import Category from '@shopComponents/Category'
import Product from '@shopComponents/Product'
import Cart from '@shopComponents/Cart'
import Checkout from '@shopComponents/Checkout'
import Order from '@shopComponents/Order'

export default async function Content({ contentType, pageData }) {
  const pageTID = pageData.slug === 'home' ? pageData.slug : contentType

  let Content
  switch (pageTID) {
    case 'blog':
      Content = Blog
      break
    case 'work':
      Content = Work
      break
    case 'shop':
      Content = Shop
      break
    case 'cart':
      Content = Cart
      break
    case 'checkout':
      Content = Checkout
      break
    case 'login':
      Content = Order
      break
    case 'orders':
      Content = Order
      break
    case 'articles':
      Content = Article
      break
    case 'projects':
      Content = Project
      break
    case 'products':
      Content = Product
      break
    case 'categories':
      Content = Category
      break
    default:
      Content = BlockManager
      break
  }

  return <Content {...pageData} />
}
