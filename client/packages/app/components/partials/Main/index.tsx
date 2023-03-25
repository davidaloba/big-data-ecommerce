import AppManager from '@appModules/ModuleManager'
import ModuleManager from '@marketingModules/ModuleManager'
import BlockManager from '@marketingComponents/BlockManager'

const Main = ({ blocks, modules, children, perPage }) => {
  if (!modules && !blocks) {
    return <main className="h-screen"></main>
  }
  return (
    <main>
      {children}
      {modules && (
        <AppManager
          modules={modules}
          perPage={perPage || 12}
        />
      )}
      {modules && (
        <ModuleManager
          modules={modules}
          perPage={perPage || 12}
        />
      )}
      {blocks && <BlockManager blocks={blocks} />}
    </main>
  )
}

export default Main
