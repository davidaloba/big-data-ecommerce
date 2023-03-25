import dynamic from 'next/dynamic'

const Article = dynamic(() => import('./blog/components/Article'), {
  ssr: false
})
const Articles = dynamic(() => import('./blog/components/Articles'), {
  ssr: true
})
const Project = dynamic(() => import('./work/components/Project'), {
  ssr: true
})
const Projects = dynamic(() => import('./work/components/Projects'), {
  ssr: true
})

const ModuleManager = ({ modules, perPage }) => {
  return (
    <div>
      {modules.map((module, index) => {
        const { __component, ...rest } = module

        let Module
        switch (__component) {
          case 'modules.article':
            Module = Article
            break
          case 'modules.articles':
            Module = Articles
            break
          case 'modules.project':
            Module = Project
            break
          case 'modules.projects':
            Module = Projects
            break
        }

        return Module ? (
          <Module
            key={`index-${index}`}
            perPage={perPage}
            {...rest}
          />
        ) : null
      })}
    </div>
  )
}

export default ModuleManager
