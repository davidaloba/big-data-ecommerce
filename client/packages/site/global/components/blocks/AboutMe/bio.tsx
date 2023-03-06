const Bio = ({ headline, currentProject, text }) => {
  return (
    <div className="mt-20">
      <p
        className="leading-loose text-2xl md:text-4xl font-semibold "
        style={{ lineHeight: '3rem' }}>
        {headline}{' '}
      </p>
      <p className="mt-4 text-2xl md:text-2xl">{text}</p>
      <div className="mt-4 flex md:text-2xl text-2xl font-bold  ">
        <p className="">
          Currently working on
          <a
            className="ml-4 px-2 py-1 rounded-md bg-orange-700 text-gray-50 "
            href={currentProject.href}>
            {currentProject.label + ' ' + '✈️'}
          </a>
        </p>
      </div>
    </div>
  )
}

Bio.defaultProps = {}

export default Bio
