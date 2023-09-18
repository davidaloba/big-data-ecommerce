'use client'

import { usePathname } from 'next/navigation'
import { useGetPageDataQuery } from '@globalStore/api'
import { getData } from '@globalUtils/index'

import ErrorPage from 'next/error'
import Seo from '@globalComponents/partials/seo'
import BlockManager from '@features/pages/components/BlockManager'
import Blog from '@features/blog/components/Blog'
import Article from '@features/blog/components/Article'
import Work from '@features/work/components/Work'
import Project from '@features/work/components/Project'
import Shop from '@features/shop/components/Shop'
import Category from '@features/shop/components/Category'
import Product from '@features/shop/components/Product'
import Cart from '@features/shop/components/Cart'
import Checkout from '@features/shop/components/Checkout'
import Order from '@features/shop/components/Order'

const PageRouter = () => {
  const { apiUrl, pageID, contentType } = getData(usePathname())
  const { data: pageData } = useGetPageDataQuery(apiUrl)

  if (!pageData) return <ErrorPage statusCode={404} />

  const pageTID = pageID === 'home' ? pageID : contentType

  let Page
  switch (pageTID) {
    case 'blog':
      Page = Blog
      break
    case 'work':
      Page = Work
      break
    case 'shop':
      Page = Shop
      break
    case 'cart':
      Page = Cart
      break
    case 'checkout':
      Page = Checkout
      break
    case 'orders':
      Page = Order
      break
    case 'articles':
      Page = Article
      break
    case 'projects':
      Page = Project
      break
    case 'products':
      Page = Product
      break
    case 'categories':
      Page = Category
      break
    default:
      Page = BlockManager
      break
  }

  const props = {
    apiUrl,
    contentType,
    pageID,
    ...pageData
  }

  return (
    <>
      {pageData.seo && <Seo seo={pageData.seo} />}
      <Page {...props} />
    </>
  )
}

export default PageRouter
