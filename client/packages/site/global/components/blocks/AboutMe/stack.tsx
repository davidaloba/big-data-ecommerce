import { getStrapiMedia } from '@siteUtils/index'

const Stack = ({ technologies, title, text }) => {
  const techs = technologies.data || []

  return (
    <div className="mt-20">
      <h1 className="px-2 bg-orange-700 text-3xl rounded-md inline-block font-bold text-gray-50">
        {title}
      </h1>
      <div className="flex flex-row flex-wrap mt-8">
        {techs &&
          techs.map((tech, id) => (
            <img
              key={id}
              src={getStrapiMedia(tech.attributes.url)}
              className="h-20 w-20 mx-4 my-4"
            />
          ))}
      </div>
    </div>
  )
}

Stack.defaultProps = {}

export default Stack
