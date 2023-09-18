const Filter = ({ categories, setFilterByCategory, refetch }) => {
  return (
    <>
      {categories && (
        <select
          name="category"
          id="category"
          className=" uppercase min-w-[160px] ml-4  px-2 border border-gray-300 bg-white"
          onChange={(e) => {
            setFilterByCategory(e.target.value)
            refetch()
          }}>
          <option value="">All Categories</option>
          {categories.map((category) => (
            <option
              key={category.slug}
              value={category.slug}>
              {category.name}
            </option>
          ))}
        </select>
      )}
    </>
  )
}

export default Filter
