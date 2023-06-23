const Sort = ({ setOpenFilter, openSort, setOpenSort, sortBy, setSortBy, refetch }) => {
  return (
    <>
      <button
        className={` z-10 ${openSort && 'border-b-0'} bg-white border-gray-300`}
        onClick={() => {
          setOpenSort(!openSort)
          setOpenFilter(false)
        }}>
        Sort
      </button>
      {openSort && (
        <div
          className={`-z-10 fixed md:absolute flex flex-col gap-1 w-screen md:w-max top-[60px] md:top-6 right-0 pl-4 pr-8 pt-6 pb-5 border border-gray-300 bg-white  `}>
          <div className=" flex ">
            <div
              className={` h-[13px] w-[13px] 
                    ${
                      sortBy === 'price (low to high)' && 'bg-gray-600'
                    } mr-2 border border-gray-200 `}>
              <input
                type="checkbox"
                checked={sortBy === 'price (low to high)' ? true : false}
                value={sortBy}
                className="opacity-0 cursor-pointer"
                onChange={() => {
                  setSortBy(sortBy === 'price (low to high)' ? '' : 'price (low to high)')
                  refetch()
                }}
              />
            </div>
            <label className=" min-w-max uppercase">price (low to high)</label>
          </div>
          <div className=" flex ">
            <div
              className={` h-[13px] w-[13px] 
                    ${
                      sortBy === 'price (high to low)' && 'bg-gray-600'
                    } mr-2 border border-gray-200 `}>
              <input
                type="checkbox"
                checked={sortBy === 'price (high to low)' ? true : false}
                value={sortBy}
                className="opacity-0 cursor-pointer"
                onChange={() => {
                  setSortBy(sortBy === 'price (high to low)' ? '' : 'price (high to low)')
                  refetch()
                }}
              />
            </div>
            <label className=" min-w-max uppercase">price (high to low)</label>
          </div>
          <div className=" flex ">
            <div
              className={` h-[13px] w-[13px] 
                    ${sortBy === 'newest' && 'bg-gray-600'} mr-2 border border-gray-200 `}>
              <input
                type="checkbox"
                checked={sortBy === 'newest' ? true : false}
                value={sortBy}
                className=" opacity-0 cursor-pointer"
                onChange={() => {
                  setSortBy(sortBy === 'newest' ? '' : 'newest')
                  refetch()
                }}
              />
            </div>
            <label className=" min-w-max uppercase">newest</label>
          </div>
        </div>
      )}
    </>
  )
}

export default Sort
