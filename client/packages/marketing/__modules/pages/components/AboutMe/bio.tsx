const Bio = ({ headline, currentProject, text }) => {
  return (
    <div className="">
      <p className=" text-3xl md:text-4xl lg:text-5xl lg:leading-tight font-semibold ">
        {headline}{' '}
      </p>
      <p className="mt-4 text-xl md:text-2xl">{text}</p>
      <div className="mt-4 flex text-xl md:text-2xl  font-bold  ">
        <p className="">
          Currently working on
          <a
            className="block md:inline ml-0 md:ml-4 px-2 py-1 rounded-md bg-orange-600 text-gray-50 "
            href={currentProject.href}>
            {currentProject.label + ' ' + '✈️'}
          </a>
        </p>
      </div>
    </div>
  )
}

export default Bio
