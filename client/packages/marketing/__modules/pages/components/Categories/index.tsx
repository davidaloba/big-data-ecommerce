import Repeatable from '@appComponents/__lib/Repeatable'
import CategoryCard from './category-card'

const Categories = ({ categories }) => {
  return (
    <Repeatable
      className=" 2xl:gap-12"
      Element={CategoryCard}
      elements={categories}
      style={{
        container: `
          md:grid md:grid-cols-2 md:gap-6 lg:gap-8 2xl:gap-12
          flex flex-col gap-4 
          md:px-6 lg:px-8 2xl:px-12
          px-4
        `,
        wrapper: 'md:col-span-1 [&:nth-child(3)]:md:col-span-2'
      }}
      pre="category"
    />
  )
}

export default Categories
