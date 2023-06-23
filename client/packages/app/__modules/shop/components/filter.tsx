const Filter = ({
  colors,
  sizes,
  setOpenSort,
  openFilter,
  setOpenFilter,
  filterByColor,
  filterBySize,
  setFilterByColor,
  setFilterBySize,
  refetch
}) => {
  return (
    <>
      <button
        className={`relative z-10 ${openFilter && 'border-b-0'} bg-white border-gray-300`}
        onClick={() => {
          setOpenFilter(!openFilter)
          setOpenSort(false)
        }}>
        Filter
      </button>
      {openFilter && (
        <div className=" fixed md:absolute flex flex-col gap-8 w-screen md:w-max top-[60px] md:top-6 right-0 pl-4 pr-8 pt-6 pb-5 border border-gray-300 bg-white">
          <div>
            <p className="mb-4 text-left uppercase">Colors</p>
            <div className={`grid grid-cols-2 gap-1`}>
              {colors.map((color, i) => (
                <div
                  key={i}
                  className=" flex ">
                  <div
                    className={` h-[13px] w-[13px] 
                    ${
                      filterByColor.includes(color) && 'bg-gray-600'
                    } mr-2 border border-gray-200 `}>
                    <input
                      type="checkbox"
                      checked={filterByColor.includes(color) ? true : false}
                      value={filterByColor}
                      className="opacity-0 cursor-pointer"
                      onChange={() => {
                        setFilterByColor(
                          filterByColor.includes(color)
                            ? filterByColor.filter((x) => color !== x)
                            : [...filterByColor, color]
                        )
                        refetch()
                      }}
                    />
                  </div>
                  <label className=" min-w-max uppercase">{color}</label>
                </div>
              ))}
            </div>
          </div>
          <div>
            <p className="mb-4 text-left uppercase">Sizes</p>
            <div className={`grid grid-cols-2 gap-1`}>
              {sizes.map((size, i) => (
                <div
                  key={i}
                  className=" flex ">
                  <div
                    className={` h-[13px] w-[13px] 
                    ${filterBySize.includes(size) && 'bg-gray-600'} mr-2 border border-gray-200 `}>
                    <input
                      type="checkbox"
                      checked={filterBySize.includes(size) ? true : false}
                      value={filterBySize}
                      className="opacity-0 cursor-pointer"
                      onChange={() => {
                        setFilterBySize(
                          filterBySize.includes(size)
                            ? [...filterBySize.filter((x) => size !== x)]
                            : [...filterBySize, size]
                        )
                        refetch()
                      }}
                    />
                  </div>
                  <label className=" min-w-max uppercase">{size}</label>
                </div>
              ))}
            </div>
          </div>
        </div>
      )}
    </>
  )
}

export default Filter
