import dynamic from 'next/dynamic'

const Hero = dynamic(() => import('./Hero'), {
  ssr: true
})
const PageTitle = dynamic(() => import('./PageTitle'), {
  ssr: true
})
const FeaturedProjects = dynamic(() => import('./FeaturedProjects'), {
  ssr: true
})
const LatestCode = dynamic(() => import('./LatestCode'), {
  ssr: true
})
const AboutMe = dynamic(() => import('./AboutMe'), {
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

BlockManager.defaultProps = {
  blocks: []
}

export default BlockManager
