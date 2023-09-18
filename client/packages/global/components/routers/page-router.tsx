'use client'

import { usePathname } from 'next/navigation'
import { useGetPageDataQuery } from '@globalStore/api'
import { getData } from '@globalUtils/index'

import ErrorPage from 'next/error'
import Seo from '@marketingComponents/partials/seo'
import BlockManager from '@marketingModules/pages/components/BlockManager'
import Blog from '@marketingModules/blog/components/Blog'
import Article from '@marketingModules/blog/components/Article'
import Work from '@marketingModules/work/components/Work'
import Project from '@marketingModules/work/components/Project'
import Shop from '@appModules/shop/components/Shop'
import Category from '@appModules/shop/components/Category'
import Product from '@appModules/shop/components/Product'
import Cart from '@appModules/shop/components/Cart'
import Checkout from '@appModules/shop/components/Checkout'
import Order from '@appModules/shop/components/Order'

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
