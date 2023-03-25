import BlockManager from '@marketingComponents/BlockManager'

const Main = ({ pageData, children }) => {
  const blocks = pageData.blocks || []
  const modules = pageData.main
  const perPage = pageData.perPage

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
