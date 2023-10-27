'use client'

import { usePathname } from 'next/navigation'
import { useGetPageDataQuery } from '@app/_global/store/api'
import { getData } from '@app/_global/utils/index'

import ErrorPage from 'next/error'
import Seo from '@app/_global/components/partials/seo'
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
