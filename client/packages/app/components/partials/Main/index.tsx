import BlockManager from './BlockManager'

const Main = ({ children, blocks, perPage }) => {
  if (!blocks[0]) {
    return <main className="min-h-screen"></main>
  }
  return (
    <main className="min-h-screen">
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
