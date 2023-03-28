import Repeatable from '@appComponents/__lib/Repeatable'
import CategoryCard from './category-card'

const Categories = ({ categories }) => {
  return (
    <Repeatable
      // className=" gap"
      Element={CategoryCard}
      elements={categories}
      style={{
        container: `
          flex flex-col gap-4 
          px-4
          md:grid md:grid-cols-2 md:grid-rows-4 md:gap-6 lg:gap-8 
          md:px-6 lg:px-8`,
        wrapper: 'md:row-span-1 md:col-span-1 [&:nth-child(3)]:md:col-span-2'
      }}
      pre="category"
    />
  )
}

export default Categories
