import { useState } from 'react'
import { useGetProductsQuery } from '../store/api'
import ProductCard from './__lib/ProductCard'
import Header from '@components/__lib/Header'
import NoResults from '@components/pages/no-results'
import { useGetTagsQuery, useGetCategoriesQuery } from '@store/api'

const Products = ({ header, perPage }) => {
  const [tagId, setTagId] = useState(null)
  const [categoryId, setCategoryId] = useState(null)
  const [pageNumber, setPageNumber] = useState(1)

  const { data: categories } = useGetCategoriesQuery()
  const { data: tags } = useGetTagsQuery()
  const key = {
    perPage,
    category: categoryId,
    tag: tagId,
    page: pageNumber
  }
  const { data: products, isSuccess, refetch } = useGetProductsQuery(key)

  const categoryText = 'Category'
  const tagText = 'Tag'
  const lastPage = (products && Math.ceil(products.length / perPage)) || 1

  return (
    <>
      {isSuccess && (
        <div>
          <Header {...header} />
          <div className="flex flex-col md:flex-row gap-2 my-24 px-4">
            <div>
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
            </div>
            <div>
              <select
                className="block w-52 py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-primary-500 focus:border-primary-500"
                onChange={(value) => setTagId(value.target.value)}>
                <option value="">{tagId ? 'Clear filter' : tagText || 'Select a tag'}</option>
                {tags &&
                  tags.map((tag, index) => (
                    <option
                      key={`tagOption-${index}`}
                      value={tag.attributes.name}>
                      {tag.attributes.name}
                    </option>
                  ))}
              </select>
            </div>
          </div>
          <NoResults
            status={isSuccess}
            length={products && products}
          />
          <div className="grid md:grid-cols-3 sm:grid-cols-2 grid-cols-1 gap-16 mt-24 px-4">
            {isSuccess &&
              products &&
              products.map((product, index) => (
                <ProductCard
                  {...product.attributes}
                  key={index}
                />
              ))}
          </div>
          {products.length > 0 && (
            <div className="grid grid-cols-3 gap-4 my-24">
              <div className="col-start-2 col-end-3">
                <div className="flex items-center">
                  <button
                    type="button"
                    className={`${
                      pageNumber <= 1 ? 'cursor-not-allowed opacity-50' : ''
                    } w-full p-4 border text-base rounded-l-xl text-gray-600 bg-white hover:bg-gray-100 focus:outline-none`}
                    onClick={() => {
                      setPageNumber(pageNumber - 1)
                      refetch()
                    }}
                    disabled={pageNumber <= 1}>
                    Previous
                  </button>

                  <button
                    type="button"
                    className={`${
                      pageNumber >= lastPage ? 'cursor-not-allowed opacity-50' : ''
                    } w-full p-4 border-t border-b border-r text-base rounded-r-xl text-gray-600 bg-white hover:bg-gray-100 focus:outline-none`}
                    onClick={() => {
                      setPageNumber(pageNumber + 1)
                      refetch()
                    }}
                    disabled={pageNumber >= lastPage}>
                    Next
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>
      )}
    </>
  )
}

export default Products
