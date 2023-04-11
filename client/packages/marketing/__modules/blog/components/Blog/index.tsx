'use client'
import { useState } from 'react'
import { useGetArticlesQuery } from '../../store/api'
import ArticleCard from '../ArticleCard'
import SideBar from '../BlogSideBar'
import NoResults from '@marketingComponents/__lib/no-results'
import PageTitle from '@marketingComponents/__lib/PageTitle'
import Repeatable from '@marketingComponents/__lib/Repeatable'

const Articles = ({ perPage, contentType, slug, name }) => {
  const [pageNumber, setPageNumber] = useState(1)

  const key = {
    slug: slug,
    contentType: contentType,
    page: pageNumber,
    perPage
  }
  const { data: articles, isSuccess } = useGetArticlesQuery(key)
  const lastPage = (isSuccess && articles && Math.ceil(articles.length / perPage)) || 1
  console.log(pageNumber, articles)

  let title
  switch (contentType) {
    case 'topics':
      title = `Blog / Topic / ${name}`
      break
    case 'authors':
      title = `Blog / Author / ${name}`
      break
    default:
      title = 'Blog'
      break
  }

  return (
    <>
      <PageTitle
        title={title}
        text=""
        theme="primary"
      />
      <section>
        <div className="flex flex-col lg:flex-row gap-10">
          {articles && articles.length > 0 ? (
            <>
              <Repeatable
                Element={ArticleCard}
                elements={articles}
                style={{
                  container: ` mt-10 flex md:grid md:grid-cols-2 2xl:grid-cols-3 gap-10 `,
                  wrapper: `md:col-span-1 md:col-span-1`
                }}
                pre="product"
              />
            </>
          ) : (
            <NoResults
              status={isSuccess}
              length={articles && articles.length}
            />
          )}
          <SideBar />
        </div>
        {isSuccess && (
          <div className="mt-10 grid grid-cols-3 gap-4 ">
            <div className="col-start-2 col-end-3 flex items-center">
              <button
                type="button"
                className={`${
                  pageNumber <= 1 ? 'cursor-not-allowed opacity-50' : ''
                } w-full p-4 border ase rounded-l-xl text-gray-600 bg-white hover:bg-gray-100 focus:outline-none`}
                onClick={() => setPageNumber(pageNumber - 1)}
                disabled={pageNumber <= 1}>
                Previous
              </button>
              <button
                type="button"
                className={`${
                  pageNumber >= lastPage ? 'cursor-not-allowed opacity-50' : ''
                } w-full p-4 border-t border-b border-r ase rounded-r-xl text-gray-600 bg-white hover:bg-gray-100 focus:outline-none`}
                onClick={() => setPageNumber(pageNumber + 1)}
                disabled={pageNumber >= lastPage}>
                Next
              </button>
            </div>
          </div>
        )}
      </section>
    </>
  )
}

export default Articles
