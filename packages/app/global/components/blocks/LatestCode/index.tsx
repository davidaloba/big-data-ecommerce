import { useEffect, useState } from 'react'
import { getStrapiMedia } from '@utils/index'
import Link from 'next/link'
import userData from '../../../data'
import GithubRepoCard from './github-repo-card'
import Header from '@components/__lib/Header'

const LatestCode = ({ theme, header, text }) => {
  const label = header.label
  const title = header.title
  const [repos, setRepos] = useState([])

  return (
    <section className="py-40 px-8 bg-[#F1F1F1] ">
      <Header {...header} />

      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-6xl mx-auto px-10 lg:-mt-10 gap-y-20">
        {repos &&
          repos.map((latestRepo, idx) => (
            <GithubRepoCard
              latestRepo={latestRepo}
              key="idx"
            />
          ))}
      </div>
    </section>
  )
}

LatestCode.defaultProps = {}

export default LatestCode
