import Repeatable from '@marketingComponents/__lib/Repeatable'
import { useGetArticlesQuery, useGetTopicsQuery } from '@marketingModules/blog/store/articles.api'
import Link from 'next/link'

const SideBar = ({ relatedArticles }: { relatedArticles? }) => {
  const { data: topics, isSuccess: topicSuccess } = useGetTopicsQuery('topics')
  const key = {
    slug: null,
    contentType: 'recent',
    page: 1,
    perPage: 4
  }
  const { data: recentArticles, isSuccess: recentArticlesSuccess } = useGetArticlesQuery(key)

  return (
    <aside className=" min-w-[30%] px-3">
      {topicSuccess ? (
        <div>
          <h1 className="font-semibold">Topics</h1>
          <Repeatable
            elements={topics}
            Element={({ attributes }) => (
              <Link
                className="underline hover:text-blue-500"
                href={`/topic/${attributes.slug}`}>
                {attributes.name}
              </Link>
            )}
            style={{
              container: ` mt-2 flex gap-10 `,
              wrapper: ``
            }}
            pre="product"
          />
        </div>
      ) : (
        <div>Loading...</div>
      )}
      {relatedArticles && (
        <div className="mt-10">
          <h1 className="font-semibold">Related Articles</h1>
          <Repeatable
            elements={relatedArticles.data}
            Element={({ attributes }) => (
              <Link
                className="underline hover:text-blue-500"
                href={`/blog/${attributes.slug}`}>
                {attributes.title}
              </Link>
            )}
            style={{
              container: ` mt-2 flex gap-10 `,
              wrapper: ``
            }}
            pre="product"
          />
        </div>
      )}
      {recentArticlesSuccess && (
        <div className="mt-10">
          <h1 className="font-semibold">Recent Articles</h1>
          <Repeatable
            elements={recentArticles}
            Element={({ attributes }) => (
              <Link
                className="underline hover:text-blue-500"
                href={`/blog/${attributes.slug}`}>
                {attributes.title}
              </Link>
            )}
            style={{
              container: ` mt-2 flex gap-10 `,
              wrapper: ``
            }}
            pre="product"
          />
        </div>
      )}
    </aside>
  )
}

export default SideBar
