import dynamic from 'next/dynamic'

const Cta = dynamic(() => import('./Cta'), {
  ssr: true
})
const CtaCommandLine = dynamic(() => import('./CtaCommandLine'), {
  ssr: true
})
const Faq = dynamic(() => import('./Faq'), {
  ssr: true
})
const FeaturedProjects = dynamic(() => import('./FeaturedProjects'), {
  ssr: true
})
const LatestCode = dynamic(() => import('./LatestCode'), {
  ssr: true
})
const Hero = dynamic(() => import('./Hero'), {
  ssr: true
})
const Pricing = dynamic(() => import('./Pricing'), {
  ssr: true
})
const Team = dynamic(() => import('./Team'), {
  ssr: true
})
const Testimonial = dynamic(() => import('./Testimonial'), {
  ssr: true
})

const getBlockComponent = ({ __component, ...rest }, index) => {
  let Block

  switch (__component) {
    case 'blocks.faq':
      Block = Faq
      break
    case 'blocks.hero':
      Block = Hero
      break
    case 'blocks.cta':
      Block = Cta
      break
    case 'blocks.team':
      Block = Team
      break
    case 'blocks.pricing':
      Block = Pricing
      break
    case 'blocks.featured-projects':
      Block = FeaturedProjects
      break
    case 'blocks.testimonial':
      Block = Testimonial
      break
    case 'blocks.cta-command-line':
      Block = CtaCommandLine
      break
    case 'blocks.latest-code':
      Block = LatestCode
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
