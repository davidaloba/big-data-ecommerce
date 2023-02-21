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
// @ts-expect-error TS(2345): Argument of type '() => Promise<typeof import("/ho... Remove this comment to see the full error message
const Features = dynamic(() => import('./Features'), {
  ssr: true
})
// @ts-expect-error TS(2345): Argument of type '() => Promise<typeof import("/ho... Remove this comment to see the full error message
const FeaturesWithImages = dynamic(() => import('./FeaturesWithImages'), {
  ssr: true
})
// @ts-expect-error TS(2345): Argument of type '() => Promise<typeof import("/ho... Remove this comment to see the full error message
const Hero = dynamic(() => import('./Hero'), {
  ssr: true
})
// @ts-expect-error TS(2345): Argument of type '() => Promise<typeof import("/ho... Remove this comment to see the full error message
const Pricing = dynamic(() => import('./Pricing'), {
  ssr: true
})
// @ts-expect-error TS(2345): Argument of type '() => Promise<typeof import("/ho... Remove this comment to see the full error message
const Team = dynamic(() => import('./Team'), {
  ssr: true
})
// @ts-expect-error TS(2345): Argument of type '() => Promise<typeof import("/ho... Remove this comment to see the full error message
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
    case 'blocks.features':
      Block = Features
      break
    case 'blocks.testimonial':
      Block = Testimonial
      break
    case 'blocks.cta-command-line':
      Block = CtaCommandLine
      break
    case 'blocks.features-with-images':
      Block = FeaturesWithImages
      break
  }
  return Block ? (
    // @ts-expect-error TS(2749): 'Block' refers to a value, but is being used as a ... Remove this comment to see the full error message
    <Block
      // @ts-expect-error TS(2304): Cannot find name 'key'.
      key={`index-${index}`}
      // @ts-expect-error TS(2304): Cannot find name 'rest'.
      {...rest}
    />
  ) : null
}

const BlockManager = ({ blocks }) => {
  // @ts-expect-error TS(2304): Cannot find name 'div'.
  return <div>{blocks.map(getBlockComponent)}</div>
}

BlockManager.defaultProps = {
  blocks: []
}

export default BlockManager
