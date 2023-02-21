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
    // @ts-expect-error TS(2749): 'Block' refers to a value, but is being used as a ... Remove this comment to see the full error message
    <Block
      // @ts-expect-error TS(2304): Cannot find name 'key'.
      key={`index-${index}`}
      // @ts-expect-error TS(2304): Cannot find name 'rest'.
      {...rest}
    />
  ) : null
}

const LayoutManager = ({ blocks }) => {
  // @ts-expect-error TS(2304): Cannot find name 'div'.
  return <div>{blocks.map(getBlockComponent)}</div>
}

LayoutManager.defaultProps = {
  blocks: []
}

export default LayoutManager
