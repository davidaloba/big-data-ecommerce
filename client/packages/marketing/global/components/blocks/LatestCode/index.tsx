import GithubRepoCard from './github-repo-card'
import Header from '@marketingComponents/__lib/Header'
import { useGetLatestReposQuery } from '@marketingStore/api'

const LatestCode = ({ header }) => {
  const { data: repos, isSuccess } = useGetLatestReposQuery('davidaloba')
  console.log(repos)

  return (
    <section className="bg-[#F1F1F1] ">
      <Header {...header} />

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4 mx-auto mt-20 gap-y-12 xl:gap-y-20 px-10">
        {isSuccess &&
          repos &&
          repos.map((latestRepo, idx: string) => (
            <GithubRepoCard
              latestRepo={latestRepo}
              key={idx}
            />
          ))}
      </div>
    </section>
  )
}

LatestCode.defaultProps = {}

export default LatestCode
