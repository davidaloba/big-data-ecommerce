import dynamic from 'next/dynamic'

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

const getBlockComponent = ({ __component, ...rest }, index) => {
  let Block

  switch (__component) {
    case 'blocks.featured-projects':
      Block = FeaturedProjects
      break
    case 'blocks.latest-code':
      Block = LatestCode
      break
    case 'blocks.hero':
      Block = Hero
      break
    case 'blocks.page-title':
      Block = PageTitle
      break
    case 'blocks.about-me':
      Block = AboutMe
      break
  }
  return Block ? (
    <Block
      key={`index-${index}`}
      {...rest}
    />
  ) : null
}

const BlockManager = ({ blocks }) => {
  return <div>{blocks.map(getBlockComponent)}</div>
}

export default BlockManager
