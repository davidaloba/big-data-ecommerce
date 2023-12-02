const Filter = ({ authors, topics, setFilterByAuthor, setFilterByTopic, refetch }) => {
  return (
    <>
      {authors && (
        <select
          name="author"
          id="author"
          className=" uppercase min-w-[160px]  px-2 border border-gray-300 bg-white"
          onChange={(e) => {
            setFilterByAuthor(e.target.value)
            refetch()
          }}>
          <option value="">All Authors</option>
          {authors.map((author) => (
            <option
              key={author.slug}
              value={author.slug}>
              {author.name}
            </option>
          ))}
        </select>
      )}
      {topics && (
        <select
          name="topic"
          id="topic"
          className=" uppercase min-w-[160px] ml-4  px-2 border border-gray-300 bg-white"
          onChange={(e) => {
            setFilterByTopic(e.target.value)
            refetch()
          }}>
          <option value="">All Topics</option>
          {topics.map((topic) => (
            <option
              key={topic.slug}
              value={topic.slug}>
              {topic.name}
            </option>
          ))}
        </select>
      )}
    </>
  )
}

export default Filter
