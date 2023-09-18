import { useGetKindsQuery, useGetProjectsQuery } from '../../store/projects.api'
import WorkCard from './work-card'
import NoResults from '@globalComponents/__lib/no-results'
import Repeatable from '@globalComponents/__lib/Repeatable'
import BlockManager from '@features/pages/components/BlockManager'
import { useState } from 'react'
import Filter from './filter'

const Projects = ({ perPage, blocks }) => {
  const { categories } = useGetKindsQuery(
    {},
    {
      selectFromResult: ({ data }) => ({
        categories: data?.reduce((a, c) => {
          return a.concat({ name: c.attributes.name, slug: c.attributes.slug })
        }, [])
      })
    }
  )

  const [filterByCategory, setFilterByCategory] = useState('')
  const {
    data: projects,
    isSuccess,
    refetch
  } = useGetProjectsQuery({
    page: 1,
    perPage,
    category: filterByCategory
  })

  return (
    <>
      <section
        className="px-4 md:px-6 lg:px-8 2xl:px-12 py-4
          flex flex-row items-center justify-between bg-white border-t">
        <div className="uppercase">WORK</div>

        <Filter
          categories={[...new Set(categories)]}
          setFilterByCategory={setFilterByCategory}
          refetch={refetch}
        />
      </section>
      <section className="p-0">
        {projects && projects.length > 0 ? (
          <Repeatable
            Element={WorkCard}
            elements={projects}
            style={{
              container: `
             flex flex-row flex-wrap justify-evenly
             px-4 md:px-0
             `,
              wrapper:
                'w-[100%] mb-16 md:w-[100%] md:[&:nth-child(2)]:w-[40%] md:[&:nth-child(3)]:w-[40%]  '
            }}
            pre="work"
          />
        ) : (
          <NoResults
            status={isSuccess}
            length={projects && projects.length}
          />
        )}
      </section>
      {blocks && (
        <BlockManager
          blocks={blocks}
          perPage={perPage}
        />
      )}
    </>
  )
}

export default Projects
