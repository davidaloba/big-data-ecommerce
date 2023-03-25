import { useState } from 'react'
import { useGetProductsQuery } from '../store/api'
import ProductCard from './ProductCard'
import Header from '@marketingComponents/__lib/Header'
import NoResults from '@marketingComponents/__lib/no-results'

const Products = ({ header, perPage }) => {
  const [pageNumber, setPageNumber] = useState(1)

  const key = {
    perPage,
    page: pageNumber
  }
  const { data: products, isSuccess, refetch } = useGetProductsQuery(key)

  const lastPage = (products && Math.ceil(products.length / perPage)) || 1

  return (
    <>
      {isSuccess && (
        <div>
          <Header {...header} />
          <div className="flex flex-col md:flex-row gap-2 my-24 px-4"></div>
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
