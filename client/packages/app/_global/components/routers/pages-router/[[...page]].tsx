import { wrapper } from '@globalStore/index'
import {
  getGlobal,
  getPageData,
  getRunningQueriesThunk,
  useGetGlobalQuery,
  useGetPageDataQuery
} from '@globalStore/api'
import { getStrapiApi } from '@globalUtils/index'
import ErrorPage from 'next/error'

import GlobalLayout from '@globalComponents/layouts/layout'
import Seo from '@globalComponents/partials/seo'
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

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  const { apiUrl, pageID, contentType } = getStrapiApi(context.query.page || '', context.preview)
  try {
    await Promise.all([
      store.dispatch(getPageData.initiate(apiUrl)),
      store.dispatch(getGlobal.initiate('global')),
      store.dispatch(getRunningQueriesThunk())
    ])
    return {
      props: {
        apiUrl,
        preview: context.preview || null,
        contentType,
        pageID
      }
    }
  } catch (error) {
    return {
      props: {}
    }
  }
})

const Page = ({ apiUrl, contentType, pageID, preview }: Page) => {
  const { data: globalData } = useGetGlobalQuery('global')
  const { data: pageData } = useGetPageDataQuery(apiUrl)
  const props = {
    apiUrl,
    contentType,
    pageID,
    ...pageData
  }

  if (!pageData) return <ErrorPage statusCode={404} />

  const pageTID = pageID === 'home' ? pageID : contentType
  let Layout
  switch (pageTID) {
    default:
      Layout = GlobalLayout
      break
  }
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

  return (
    <Layout
      globalData={globalData}
      preview={preview}>
      {pageData.seo && <Seo seo={pageData.seo} />}
      <Content {...props} />
    </Layout>
  )
}

export default Page
