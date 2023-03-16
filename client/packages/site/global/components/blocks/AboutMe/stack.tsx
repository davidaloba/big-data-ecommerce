import { getStrapiMedia } from '@siteUtils/index'

const Stack = ({ technologies, title, text }) => {
  const techs = technologies.data || []

  return (
    <div className="mt-20">
      <h1 className="px-2 rounded-md md:inline-block text-3xl text-center md:text-left font-bold text-gray-50 bg-orange-600 ">
        {title}
      </h1>
      <div className="mt-8 flex flex-row flex-wrap">
        {techs &&
          techs.map((tech, id) => (
            <img
              key={id}
              src={getStrapiMedia(tech.attributes.url)}
              className=" w-12 h-12 sm:w-20 sm:h-20 mx-2 my-2 md:mx-4 md:my-4"
            />
          ))}
      </div>
    </div>
  )
}

Stack.defaultProps = {}

export default Stack
