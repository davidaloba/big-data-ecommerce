import api from '@app/_global/store/api'

const pagesApi = api.injectEndpoints({
  endpoints: (build) => ({
    getLatestRepos: build.query({
      query: (username) => {
        const token = process.env.GITHUB_AUTH_TOKEN
        const url = `https://api.github.com/search/repositories?q=user:${username}+sort:author-date-asc`
        const headers = {
          Authorization: `token ${token}`
        }
        const req = {
          url: url,
          method: 'GET',
          headers: headers
        }

        return !token ? url : req
      },
      transformResponse: (res) => {
        const repos = res.items
        const latestSixRepos = repos.splice(0, 12)

        return latestSixRepos
      }
    })
  }),
  overrideExisting: false
})

export const { useGetLatestReposQuery } = pagesApi
