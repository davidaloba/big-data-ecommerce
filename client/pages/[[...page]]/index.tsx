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
import MarketingLayout from '@marketingComponents/layouts/layout'
import Seo from '@marketingComponents/partials/seo'
import BlockManager from '@marketingModules/pages/components/BlockManager'
import Blog from '@marketingModules/blog/components/Blog'
import Topic from '@marketingModules/blog/components/Topic'
import Article from '@marketingModules/blog/components/Article'
import Shop from '@appModules/shop/components/Shop'
import Category from '@appModules/shop/components/Category'
import Product from '@appModules/shop/components/Product'

interface Page {
  apiUrl: string
  preview: boolean | undefined
  contentType: string
  apiID: string
  pageID: string
}

export const getServerSideProps = wrapper.getServerSideProps((store) => async (context) => {
  try {
    const { apiUrl, pageID, contentType } = getData(context.query.page || '', context.preview)

    store.dispatch(getPageData.initiate(apiUrl))
    store.dispatch(getGlobal.initiate('global'))
    await Promise.all(store.dispatch(getRunningQueriesThunk()))

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
  const { data: global } = useGetGlobalQuery('global')
  const { data: page } = useGetPageDataQuery(apiUrl)

  if (
    !page ||
    !page.data ||
    (!Array.isArray(page.data) ? !page.data.attributes : page.data.length < 1)
  )
    return <ErrorPage statusCode={404} />

  const globalData = global.data.attributes
  const pageData = page
    ? Array.isArray(page.data)
      ? page.data[0].attributes
      : page.data.attributes
    : null
  const props = {
    apiUrl,
    contentType,
    pageID,
    sidebar: globalData.sidebar,
    ...pageData
  }

  console.log(globalData, props)
  const pageTID = pageID === 'home' ? pageID : contentType

  let Layout
  switch (pageTID) {
    default:
      Layout = MarketingLayout
      break
  }

  let Content
  switch (contentType) {
    case 'categories':
      Content = Category
      break
    case 'shop':
      Content = Shop
      break
    case 'products':
      Content = Product
      break
    case 'blog':
      Content = Blog
      break
    case 'topics':
      Content = Blog
      break
    case 'authors':
      Content = Blog
      break
    case 'articles':
      Content = Article
      break
    default:
      Content = BlockManager
      break
  }

  return (
    <Layout
      globalData={globalData}
      preview={preview}>
      <Seo seo={pageData.seo} />
      <Content {...props} />
    </Layout>
  )
}
export default Page
