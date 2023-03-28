import Repeatable from '@appComponents/__lib/Repeatable'
import CategoryCard from './category-card'

const Categories = ({ categories }) => {
  console.log(categories)

  return (
    <Repeatable
      // className=" gap"
      Element={CategoryCard}
      elements={categories}
      style={{
        container: 'grid grid-cols-2 grid-rows-4 gap-12 px-12 ',
        wrapper: 'row-span-1 col-span-1 [&:nth-child(3)]:col-span-2'
      }}
      pre="category"
    />
  )
}

export default Categories
