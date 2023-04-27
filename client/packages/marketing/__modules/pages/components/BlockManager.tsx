import dynamic from 'next/dynamic'

const FeaturedCategories = dynamic(
  () => import('@marketingModules/pages/components/FeaturedCategories'),
  {
    ssr: true
  }
)
const Section = dynamic(() => import('@marketingModules/pages/components/Section'), {
  ssr: true
})
const PageTitle = dynamic(() => import('@marketingComponents/__lib/PageTitle'), {
  ssr: true
})
const Hero = dynamic(() => import('@marketingModules/pages/components/Hero'), {
  ssr: true
})
const FeaturedProjects = dynamic(
  () => import('@marketingModules/pages/components/FeaturedProjects'),
  {
    ssr: true
  }
)
const LatestCode = dynamic(() => import('@marketingModules/pages/components/LatestCode'), {
  ssr: true
})
const AboutMe = dynamic(() => import('@marketingModules/pages/components/AboutMe'), {
  ssr: true
})

const BlockManager = ({ blocks, perPage }) => {
  return (
    <div>
      {blocks.map(({ __component, ...rest }, index) => {
        let Block

        switch (__component) {
          case 'page.section':
            Block = Section
            break
          case 'page.categories':
            Block = FeaturedCategories
            break
          case '__lib.page-title':
            Block = PageTitle
            break
          case 'page.featured-projects':
            Block = FeaturedProjects
            break
          case 'page.latest-code':
            Block = LatestCode
            break
          case 'page.hero':
            Block = Hero
            break
          case 'page.about-me':
            Block = AboutMe
            break
        }
        return Block ? (
          <Block
            key={`index-${index}`}
            perPage={perPage}
            {...rest}
          />
        ) : null
      })}
    </div>
  )
}

export default BlockManager
