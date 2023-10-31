'use client'
import dynamic from 'next/dynamic'

const FeaturedCategories = dynamic(() => import('@brochureComponents/FeaturedCategories'), {
  ssr: true
})
const PageTitle = dynamic(() => import('@app/_global/components/__lib/PageTitle'), {
  ssr: true
})
const Hero = dynamic(() => import('@brochureComponents/Hero'), {
  ssr: true
})
const FeaturedProjects = dynamic(() => import('@brochureComponents/FeaturedProjects'), {
  ssr: true
})
const LatestCode = dynamic(() => import('@brochureComponents/LatestCode'), {
  ssr: true
})
const AboutMe = dynamic(() => import('@brochureComponents/AboutMe'), {
  ssr: true
})

const BlockManager = ({ blocks, perPage }) => {
  return (
    <div>
      {blocks.map(({ __component, ...rest }, index) => {
        let Block

        switch (__component) {
          case 'page.featured-categories':
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
