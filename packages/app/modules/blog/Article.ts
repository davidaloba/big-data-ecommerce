import RelatedArticles from './components/RelatedArticles'
import ArticleContent from './components/ArticleContent'

const Article = ({ title, image, content, related }) => {
  return (
    <>
      // @ts-expect-error TS(2709): Cannot use namespace 'ArticleContent' as a type.
      <ArticleContent
        title={title}
        image={image}
        // @ts-expect-error TS(2362): The left-hand side of an arithmetic operation must... Remove this comment to see the full error message
        content={content}
      />
      // @ts-expect-error TS(2709): Cannot use namespace 'RelatedArticles' as a type.
      <RelatedArticles related={related} />
    </>
  )
}

export default Article
