import { useState } from 'react'
import PageTitle from '@siteComponents/blocks/PageTitle'
import NoResults from '@siteComponents/pages/no-results'
import ProjectCard from './ProjectCard'
import { useGetCategoriesQuery } from '@siteStore/api'
import { useGetProjectsQuery } from '../store/api'

const Projects = ({ header, perPage }) => {
  const [categoryId, setCategoryId] = useState(null)
  const [pageNumber, setPageNumber] = useState(1)
  const key = {
    category: categoryId,
    page: pageNumber,
    perPage
  }
  const { data: projects, isSuccess } = useGetProjectsQuery(key)
  const { data: categories } = useGetCategoriesQuery(`/categories?pagination[limit]=99`)
  const lastPage = (isSuccess && projects && Math.ceil(projects.length / perPage)) || 1
  console.log(projects)

  const handleSelectCategory = (value) => {
    setCategoryId(value)
  }

  return (
    <>
      {isSuccess && (
        <>
          <PageTitle {...header} />
          <section>
            <div className="mt-8 flex flex-col md:flex-row gap-2 ">
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
            <NoResults
              status={isSuccess}
              length={projects && projects.length}
            />
            {projects && (
              <>
                <div className="mt-16  ">
                  {projects &&
                    projects.map((project, index) => (
                      <ProjectCard
                        {...project.attributes}
                        key={index}
                      />
                    ))}
                </div>
                {projects.length > 0 && (
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
              </>
            )}
          </section>
        </>
      )}
    </>
  )
}

export default Projects
