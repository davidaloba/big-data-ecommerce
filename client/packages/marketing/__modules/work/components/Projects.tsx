import { useState } from 'react'
import PageTitle from '@marketingComponents/__lib/PageTitle'
import NoResults from '@marketingComponents/__lib/no-results'
import ProjectCard from './ProjectCard'
import { useGetProjectsQuery } from '../store/api'

const Projects = ({ header, perPage }) => {
  const [pageNumber, setPageNumber] = useState(1)
  const key = {
    page: pageNumber,
    perPage
  }
  const { data: projects, isSuccess } = useGetProjectsQuery(key)
  const lastPage = (isSuccess && projects && Math.ceil(projects.length / perPage)) || 1

  return (
    <>
      {isSuccess && (
        <>
          <PageTitle {...header} />
          <section>
            <div className="mt-8 flex flex-col md:flex-row gap-2 "></div>
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
