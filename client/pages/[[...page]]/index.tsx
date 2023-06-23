import { wrapper } from '@globalStore/index'
import {
  getGlobal,
  getPageData,
  getRunningQueriesThunk,
  useGetGlobalQuery,
  useGetPageDataQuery
} from '@globalStore/api'
import { getData } from '@globalUtils/index'
import ErrorPage from 'next/error'

import GlobalLayout from '@globalComponents/layouts/layout'
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

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  const { apiUrl, pageID, contentType } = getData(context.query.page || '', context.preview)
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

  const props = {
    apiUrl,
    contentType,
    pageID,
    ...pageData
  }

  console.log(globalData, props)
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
