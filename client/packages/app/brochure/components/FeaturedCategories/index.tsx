import Repeatable from '@app/_global/components/__lib/Repeatable'
import CategoryCard from './category-card'

const FeaturedCategories = ({ categories }) => {
  return (
    <Repeatable
      Element={CategoryCard}
      elements={categories}
      style={{
        container: `
          md:grid md:grid-cols-2 md:gap-6 lg:gap-8 2xl:gap-12
          flex flex-col gap-4 
          md:px-6 lg:px-8 2xl:px-12
          px-4
        `,
        wrapper:
          'md:col-span-2 [&:nth-child(2)]:md:col-span-1 [&:nth-child(3)]:md:col-span-1 max-h-[100vh] overflow-hidden'
      }}
      pre="category"
    />
  )
}

export default FeaturedCategories
