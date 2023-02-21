import { useState } from 'react'
import { useGetArticlesQuery } from './store/api'
import ArticleCard from './components/__lib/ArticleCard'
import NoResults from '@components/pages/no-results'
import Container from '@components/__lib/Container'
import Header from '@components/__lib/Header'
import { useGetCategoriesQuery } from '@store/api'

const Articles = ({ header, locale, perPage }) => {
  const [categoryId, setCategoryId] = useState(null)
  const [pageNumber, setPageNumber] = useState(1)

  const { data: categories } = useGetCategoriesQuery(`/categories?pagination[limit]=99`)
  const key = {
    locale,
    perPage,
    category: categoryId,
    page: pageNumber
  }
  const { data: articles, isSuccess } = useGetArticlesQuery(key)

  const categoryText = 'Category'
  const lastPage = (isSuccess && articles && Math.ceil(articles.length / perPage)) || 1

  return (
    <>
      {isSuccess && (
        <Container>
          <Header {...header} />
          <div className="flex flex-col md:flex-row gap-2 my-24 px-4">
            <div>
              <label className="text-gray-700">
                <select
                  className="block w-52 py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-primary-500 focus:border-primary-500"
                  onChange={(value) => setCategoryId(value.target.value)}>
                  <option value="">
                    {categoryId ? 'Clear filter' : categoryText || 'Select a category'}
                  </option>
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
          // @ts-expect-error TS(2786): 'NoResults' cannot be used as a JSX component.
          // @ts-expect-error TS(2786): 'NoResults' cannot be used as a JSX component.
          // @ts-expect-error TS(2786): 'NoResults' cannot be used as a JSX component.
          <NoResults
            status={isSuccess}
            length={articles && articles.length}
          />
          <div className="grid md:grid-cols-2 grid-cols-1 gap-40 mt-24 px-4">
            {articles &&
              articles.map((article, index) => (
                // @ts-expect-error TS(2786): 'ArticleCard' cannot be used as a JSX component.
                <ArticleCard
                  {...article.attributes}
                  locale={locale}
                  key={index}
                />
              ))}
          </div>
          {articles && articles.length > 0 && (
            <div className="grid grid-cols-3 gap-4 my-24">
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
        </Container>
      )}
    </>
  )
}

export default Articles
