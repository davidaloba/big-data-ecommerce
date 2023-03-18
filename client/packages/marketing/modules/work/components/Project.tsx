import ProjectContent from './ProjectContent'

const Project = ({ title, image, content, related }) => {
  return (
    <>
      <ProjectContent
        title={title}
        image={image}
        content={content}
      />
    </>
  )
}

export default Project
