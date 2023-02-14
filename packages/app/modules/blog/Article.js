import RelatedArticles from './components/RelatedArticles'
import ArticleContent from './components/ArticleContent'

const Article = ({ title, image, content, related }) => {
  // console.log(image, content, related)

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
