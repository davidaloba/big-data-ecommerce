import { useState } from 'react'
import { useGetArticlesQuery } from '../store/api'
import ArticleCard from './ArticleCard'
import NoResults from '@marketingComponents/__lib/no-results'
import { useGetCategoriesQuery } from '@marketingStore/api'
import PageTitle from '@marketingComponents/blocks/PageTitle'

const Articles = ({ header, perPage }) => {
  const [categoryId, setCategoryId] = useState(null)
  const [pageNumber, setPageNumber] = useState(1)
  const key = {
    category: categoryId,
    page: pageNumber,
    perPage
  }
  const { data: articles, isSuccess } = useGetArticlesQuery(key)
  const { data: categories } = useGetCategoriesQuery(`/categories?pagination[limit]=99`)
  const lastPage = (isSuccess && articles && Math.ceil(articles.length / perPage)) || 1

  const handleSelectCategory = (value) => {
    setCategoryId(value)
  }

  return (
    <>
      {isSuccess && (
        <>
          <PageTitle {...header} />
          <section>
            <div className="mt-16 flex flex-col md:flex-row gap-2 ">
              <div>
                <label className="text-gray-700">
                  <select
                    className="block w-52 py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-primary-500 focus:border-primary-500"
                    onChange={(e) => handleSelectCategory(e.target.value)}>
                    <option value="">{categoryId ? 'Clear filter' : 'Select a category'}</option>
                    {categories &&
                      categories.map((category, index) => (
                        <option
                          key={`categoryOption-${index}`}
                          value={category.attributes.name}>
                          {category.attributes.name}
                        </option>
                      ))}
                  </select>
                </label>
              </div>
            </div>
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
                      } w-full p-4 border text-base rounded-l-xl text-gray-600 bg-white hover:bg-gray-100 focus:outline-none`}
                      onClick={() => setPageNumber(pageNumber - 1)}
                      disabled={pageNumber <= 1}>
                      Previous
                    </button>

                    <button
                      type="button"
                      className={`${
                        pageNumber >= lastPage ? 'cursor-not-allowed opacity-50' : ''
                      } w-full p-4 border-t border-b border-r text-base rounded-r-xl text-gray-600 bg-white hover:bg-gray-100 focus:outline-none`}
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
