import ArticleCard from '@marketingModules/blog/components/ArticleCard'
import Header from '@marketingComponents/__lib/Header'

const RelatedArticles = ({ related }) => {
  const header = related.header
  const articles = related.articles

  return (
    <div className="bg-gray-100 my-40">
      <Header {...header} />
      <div className="w-4/5 mx-auto py-16">
        <div className="grid md:grid-cols-3 sm:grid-cols-2 grid-cols-1 gap-12 pt-12 pb-12 px-4">
          {articles &&
            articles.data.map((article, index) => (
              <ArticleCard
                {...article.attributes}
                key={index}
              />
            ))}
        </div>
      </div>
    </div>
  )
}

export default RelatedArticles
