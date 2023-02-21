import ArticleCard from '@modules/blog/components/__lib/ArticleCard'
import Container from '@components/__lib/Container'
import Header from '@components/__lib/Header'

const RelatedArticles = ({ related }) => {
  const header = related.header
  const articles = related.articles

  return (
    // @ts-expect-error TS(2709): Cannot use namespace 'Container' as a type.
    <Container>
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="bg-gray-100 my-40">
        // @ts-expect-error TS(2749): 'Header' refers to a value, but is being used as a... Remove this comment to see the full error message
        <Header {...header} />
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="w-4/5 mx-auto py-16">
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="grid md:grid-cols-3 sm:grid-cols-2 grid-cols-1 gap-12 pt-12 pb-12 px-4">
            {articles &&
              articles.data.map((article, index) => (
                // @ts-expect-error TS(2749): 'ArticleCard' refers to a value, but is being used... Remove this comment to see the full error message
                <ArticleCard
                  {...article.attributes}
                  // @ts-expect-error TS(2304): Cannot find name 'key'.
                  key={index}
                />
              ))}
          // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
          </div>
        </div>
      </div>
    </Container>
  )
}

RelatedArticles.defaultProps = {}

export default RelatedArticles
