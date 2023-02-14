import RelatedArticles from './components/RelatedArticles'
import ArticleContent from './components/ArticleContent'

const Article = ({ ...attributes }) => {
  return (
    <>
      <ArticleContent {...attributes} />
      <RelatedArticles {...attributes} />
    </>
  )
}

export default Article
