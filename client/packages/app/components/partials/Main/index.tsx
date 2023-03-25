import BlockManager from '@appComponents/BlockManager'

const Main = ({ blocks, modules, children, perPage }) => {
  if (!modules && !blocks) {
    return <main className="h-screen"></main>
  }
  return (
    <main>
      {children}
      {blocks && (
        <BlockManager
          blocks={blocks}
          perPage={perPage || 12}
        />
      )}
    </main>
  )
}

export default Main
