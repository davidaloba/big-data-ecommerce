import Image from 'next/image'
const GithubRepoCard = ({ latestRepo }) => {
  return (
    <div className="flex flex-row">
      <div>
        <Image
          src={'/avatar.jpg'}
          alt="avatar"
          width={56}
          height={32}
          className="shadow rounded-lg"
        />
      </div>
      <div className="ml-4">
        <h1 className="font-semibold   ">{latestRepo.name}</h1>
        <p className="ase font-normal my-2  ">{latestRepo.description}</p>
        <a
          href={latestRepo.clone_url}
          className="font-semibold group flex flex-row space-x-2 w-full items-center">
          <p>View Repository </p>
          <div className="transform  group-hover:translate-x-2 transition duration-300">&rarr;</div>
        </a>
      </div>
    </div>
  )
}

export default GithubRepoCard
