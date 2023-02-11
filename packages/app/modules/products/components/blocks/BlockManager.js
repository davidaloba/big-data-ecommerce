import dynamic from 'next/dynamic'

const RelatedProducts = dynamic(() => import('./RelatedProducts'), {
  ssr: true
})

const RichContent = dynamic(() => import('./RichContent'), {
  ssr: true
})

const getBlockComponent = ({ __component, ...rest }, index) => {
  let Block

  switch (__component) {
    case 'blocks.related-restaurants':
      Block = RelatedProducts
      break
    case 'restaurant.rich-content':
      Block = RichContent
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
