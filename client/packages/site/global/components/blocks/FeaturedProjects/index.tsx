import Header from '../../__lib/Header'
import ProjectCard from './project-card'

const Features = ({ header, projects }) => {
  return (
    <section className="bg-gray-50 ">
      <Header {...header} />
      <div className="mt-20 grid md:grid-cols-2 xl:grid-cols-3 gap-6">
        {projects &&
          projects.map((project) => (
            <ProjectCard
              {...project}
              key={project.slug}
            />
          ))}
      </div>
    </section>
  )
}

Features.defaultProps = {}

export default Features
