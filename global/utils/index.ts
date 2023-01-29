import type { RootState } from '@store'
import { useAppSelector, useAppDispatch } from '@store'
import { setLoading } from '@store/actions'

const state = useAppSelector((state: RootState) => state)
const dispatch = useAppDispatch()

export const fetchPosts = () => {
  try {
    dispatch(setLoading(false))
  } catch (err) {
    alert(err)
  }
}

export const getPeriod = (totalMinutes) => {
  // const diffTime = Math.abs(new Date().valueOf() - new Date(date).valueOf())
  function padTo2Digits(num) {
    return num.toString().padStart(2, '0')
  }
  const minutes = totalMinutes % 60
  const hours = Math.floor(totalMinutes / 60)
  return `${padTo2Digits(hours)}h ${padTo2Digits(minutes)}m`
}

export const numberWithCommas = (x) => {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
}
