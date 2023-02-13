import RelatedArticles from './components/RelatedArticles'
import ArticleContent from './components/ArticleContent'

const Article = ({ ...pageData }) => {
  return (
    <>
      <ArticleContent {...pageData} />
      <RelatedArticles {...pageData} />
    </>
  )
}

export default Article
