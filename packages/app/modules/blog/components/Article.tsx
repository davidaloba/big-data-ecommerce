import RelatedArticles from './RelatedArticles'
import ArticleContent from './ArticleContent'

const Article = ({ title, image, content, related }) => {
  return (
    <>
      <ArticleContent
        title={title}
        image={image}
        content={content}
      />
      <RelatedArticles related={related} />
    </>
  )
}

export default Article
