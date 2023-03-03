import Header from '../../__lib/Header'
import ProjectCard from './project-card'

const Features = ({ header, projects }) => {
  return (
    <section className="py-40 px-8  bg-gray-50 ">
      <Header {...header} />
      <div className="mt-40">
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
