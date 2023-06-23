import {
  useGetArticlesQuery,
  useGetAuthorsQuery,
  useGetTopicsQuery
} from '../../store/articles.api'
import NoResults from '@marketingComponents/__lib/no-results'
import Repeatable from '@globalComponents/__lib/Repeatable'
import BlogCard from './blog-card'
import { useState } from 'react'
import Filter from '@marketingModules/blog/components/Blog/filter'

const Blog = ({ perPage, slug }) => {
  const { topics } = useGetTopicsQuery(
    {},
    {
      selectFromResult: ({ data }) => ({
        topics: data?.reduce((a, c) => {
          return a.concat({ name: c.attributes.name, slug: c.attributes.slug })
        }, [])
      })
    }
  )
  const { authors } = useGetAuthorsQuery(
    {},
    {
      selectFromResult: ({ data }) => ({
        authors: data?.reduce((a, c) => {
          return a.concat({ name: c.attributes.name, slug: c.attributes.slug })
        }, [])
      })
    }
  )
  const [filterByAuthor, setFilterByAuthor] = useState('')
  const [filterByTopic, setFilterByTopic] = useState('')
  const {
    data: articles,
    isSuccess,
    refetch
  } = useGetArticlesQuery({
    slug,
    page: 1,
    perPage,
    author: filterByAuthor,
    topic: filterByTopic
  })

  return (
    <>
      <section
        className="px-4 md:px-6 lg:px-8 2xl:px-12 py-4
        flex flex-row items-center justify-between bg-white border-t">
        <div className="uppercase">Blog</div>
        <div className=" relative group ">
          <Filter
            authors={[...new Set(authors)]}
            topics={[...new Set(topics)]}
            setFilterByAuthor={setFilterByAuthor}
            setFilterByTopic={setFilterByTopic}
            refetch={refetch}
          />
        </div>
      </section>
      <section className="p-0">
        {articles && articles.length > 0 ? (
          <Repeatable
            Element={BlogCard}
            elements={articles}
            style={{
              container: `
                flex flex-row flex-wrap justify-evenly
                px-4 md:px-0
                `,
              wrapper:
                'w-[100%] mb-16 md:w-[100%] md:[&:nth-child(2)]:w-[40%] md:[&:nth-child(3)]:w-[40%]  '
            }}
            pre="blog"
          />
        ) : (
          <NoResults
            status={isSuccess}
            length={articles && articles.length}
          />
        )}
      </section>
    </>
  )
}

export default Blog
