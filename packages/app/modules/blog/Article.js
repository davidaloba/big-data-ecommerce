import dynamic from 'next/dynamic'
import BlockManager from './components/blocks/BlockManager'

const ArticleContent = dynamic(
  () => import('./components/blocks/ArticleContent'),
  {
    ssr: false
  }
)

const Article = ({ ...pageData }) => {
  const blocks = pageData.attributes.blocks

  return (
    <>
      <ArticleContent {...pageData} />
      {blocks && <BlockManager blocks={blocks} />}
    </>
  )
}

export default Article
