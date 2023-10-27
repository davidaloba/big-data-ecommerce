'use server'

export async function fetchData(apiUrl) {
  const res = await fetch(apiUrl)
  if (!res.ok) {
    throw new Error('Failed to fetch data')
  }
  //
  return res.json()
}
