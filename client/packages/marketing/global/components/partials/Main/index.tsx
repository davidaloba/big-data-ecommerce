import BlockManager from '@marketingComponents/blocks/BlockManager'
import ModuleManager from '@marketingModules/ModuleManager'
import AppManager from '@appModules/ModuleManager'

const Main = ({ blocks, modules, children, perPage }) => {
  if (!modules && !blocks) {
    return <main className="h-screen"></main>
  }
  return (
    <main>
      {children}
      {modules && (
        <ModuleManager
          modules={modules}
          perPage={perPage || 12}
        />
      )}
      {modules && (
        <AppManager
          modules={modules}
          perPage={perPage || 12}
        />
      )}
      {blocks && <BlockManager blocks={blocks} />}
    </main>
  )
}

Main.defaultProps = {}

export default Main
