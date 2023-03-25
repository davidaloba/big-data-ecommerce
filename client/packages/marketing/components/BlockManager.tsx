import dynamic from 'next/dynamic'

const PageTitle = dynamic(() => import('@marketingComponents/__lib/PageTitle'), {
  ssr: true
})
const Hero = dynamic(() => import('@marketingModules/pages/components/Hero'), {
  ssr: true
})
const FeaturedProjects = dynamic(
  () => import('@marketingModules/pages/components/FeaturedProjects'),
  {
    ssr: true
  }
)
const LatestCode = dynamic(() => import('@marketingModules/pages/components/LatestCode'), {
  ssr: true
})
const AboutMe = dynamic(() => import('@marketingModules/pages/components/AboutMe'), {
  ssr: true
})
const Article = dynamic(() => import('@marketingModules/blog/components/Article'), {
  ssr: false
})
const Articles = dynamic(() => import('@marketingModules/blog/components/Articles'), {
  ssr: true
})
const Project = dynamic(() => import('@marketingModules/work/components/Project'), {
  ssr: true
})
const Projects = dynamic(() => import('@marketingModules/work/components/Projects'), {
  ssr: true
})

const BlockManager = ({ blocks, perPage }) => {
  return (
    <div>
      {blocks.map(({ __component, ...rest }, index) => {
        let Block

        switch (__component) {
          case '__lib.page-title':
            Block = PageTitle
            break
          case 'page.featured-projects':
            Block = FeaturedProjects
            break
          case 'page.latest-code':
            Block = LatestCode
            break
          case 'page.hero':
            Block = Hero
            break
          case 'page.about-me':
            Block = AboutMe
            break
          case 'blog.article':
            Block = Article
            break
          case 'blog.articles':
            Block = Articles
            break
          case 'work.project':
            Block = Project
            break
          case 'work.projects':
            Block = Projects
            break
        }
        return Block ? (
          <Block
            key={`index-${index}`}
            perPage={perPage}
            {...rest}
          />
        ) : null
      })}
    </div>
  )
}

export default BlockManager
