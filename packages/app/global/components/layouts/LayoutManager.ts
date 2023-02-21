import dynamic from 'next/dynamic'

const Layout = dynamic(() => import('./layout'), {
  ssr: true
})
const AppLayout = dynamic(() => import('./applayout'), {
  ssr: true
})

const getBlockComponent = ({ __component, ...rest }, index) => {
  let Block

  switch (__component) {
    case 'default':
      Block = Layout
      break
    case 'app':
      Block = AppLayout
      break
  }

  return Block ? (
    <Block
      key={`index-${index}`}
      {...rest}
    />
  ) : null
}

const LayoutManager = ({ blocks }) => {
  return <div>{blocks.map(getBlockComponent)}</div>
}

LayoutManager.defaultProps = {
  blocks: []
}

export default LayoutManager
