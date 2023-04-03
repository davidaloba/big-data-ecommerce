'use client'
import { useState } from 'react'
import { useGetArticlesQuery } from '../store/api'
import ArticleCard from './ArticleCard'
import NoResults from '@marketingComponents/__lib/no-results'
import PageTitle from '@marketingComponents/__lib/PageTitle'

const Articles = ({ header, perPage }) => {
  const [pageNumber, setPageNumber] = useState(1)
  const key = {
    page: pageNumber,
    perPage
  }
  const { data: articles, isSuccess } = useGetArticlesQuery(key)
  const lastPage = (isSuccess && articles && Math.ceil(articles.length / perPage)) || 1

  return (
    <>
      {isSuccess && (
        <>
          <PageTitle {...header} />
          <section>
            <div className="mt-16 flex flex-col md:flex-row gap-2 "></div>
            <NoResults
              status={isSuccess}
              length={articles && articles.length}
            />
            <div className="mt-16 grid md:grid-cols-2 grid-cols-1 gap-40 ">
              {articles &&
                articles.map((article, index) => (
                  <ArticleCard
                    {...article.attributes}
                    key={index}
                  />
                ))}
            </div>
            {articles && articles.length > 0 && (
              <div className="mt-16 grid grid-cols-3 gap-4 ">
                <div className="col-start-2 col-end-3">
                  <div className="flex items-center">
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
              </div>
            )}
          </section>
        </>
      )}
    </>
  )
}

export default Articles
