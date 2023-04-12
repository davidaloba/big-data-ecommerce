'use client'
import { useGetProjectsQuery } from '../../store/api'
import ProjectCard from '../ProjectCard'
import NoResults from '@marketingComponents/__lib/no-results'
import PageTitle from '@marketingComponents/__lib/PageTitle'
import Repeatable from '@marketingComponents/__lib/Repeatable'
import BlockManager from '@marketingModules/pages/components/BlockManager'

const Projects = ({ perPage, contentType, slug, blocks }) => {
  const key = {
    slug: slug,
    contentType: contentType
  }
  const { data: projects, isSuccess } = useGetProjectsQuery('projects')

  return (
    <>
      <PageTitle
        title={`Work`}
        text=""
        theme="primary"
      />
      <section className="">
        {projects && projects.length > 0 ? (
          <>
            <Repeatable
              Element={ProjectCard}
              elements={projects}
              style={{
                container: ` mt-10 grid grid-cols-2 md:grid-cols-3 gap-10 `,
                wrapper: `md:col-span-1 md:col-span-1`
              }}
              pre="product"
            />
          </>
        ) : (
          <NoResults
            status={isSuccess}
            length={projects && projects.length}
          />
        )}
      </section>
      <BlockManager
        blocks={blocks}
        perPage={perPage}
      />
    </>
  )
}

export default Projects
