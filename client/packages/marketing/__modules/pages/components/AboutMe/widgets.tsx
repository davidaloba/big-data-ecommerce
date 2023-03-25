const Widgets = ({ widgets }) => {
  return (
    <div>
      {widgets &&
        widgets.map((widget, id) => (
          <div
            key={id}
            className="">
            <h1 className="text-xl font-semibold text-gray-700">{widget.title}</h1>
            {widget.text && (
              <div className="mt-4 flex flex-wrap text-lg text-gray-500">
                {widget.text}{' '}
                {widget.button && (
                  <a
                    href={widget.button.href}
                    className="flex flex-row items-center space-x-4 group">
                    <div className="my-4 ">&rarr;</div>
                    <div className=" text-base font-mono relative overflow-hidden ">
                      <div className="absolute h-0.5 w-full bg-gray-400 bottom-0 transform -translate-x-40 group-hover:translate-x-0 transition duration-300"></div>
                      {widget.button.label}
                    </div>
                  </a>
                )}
              </div>
            )}

            <div className="mt-4 ml-4">
              {widget.links &&
                widget.links.map((link, id) => (
                  <div
                    key={id}
                    className="flex flex-row justify-start items-center">
                    <a
                      href={link.href}
                      className="flex flex-row items-center space-x-4 group">
                      <div className="my-4">&rarr;</div>
                      <div className="text-lg text-gray-500 font-mono relative overflow-hidden ">
                        <div className="absolute h-0.5 w-full bg-gray-400 bottom-0 transform -translate-x-24 group-hover:translate-x-0 transition duration-300"></div>
                        {link.label}
                      </div>
                    </a>
                  </div>
                ))}
            </div>
          </div>
        ))}
    </div>
  )
}

export default Widgets
