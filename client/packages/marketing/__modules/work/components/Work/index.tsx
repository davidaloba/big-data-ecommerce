import { useGetProjectsQuery } from '../../store/projects.api'
import WorkCard from './work-card'
import NoResults from '@marketingComponents/__lib/no-results'
import Repeatable from '@globalComponents/__lib/Repeatable'
import BlockManager from '@marketingModules/pages/components/BlockManager'

const Projects = ({ perPage, blocks }) => {
  const { data: projects, isSuccess } = useGetProjectsQuery('projects')

  return (
    <>
      <section
        className="px-4 md:px-6 lg:px-8 2xl:px-12 py-4
          flex flex-row items-center justify-between bg-white border-t">
        <div className="uppercase">WORK</div>
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
