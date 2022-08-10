import { store } from '../store'
import axios from 'axios'

import {
  setAdminLoading,
  fetchAdminUsers,
  fetchAdminMessages
} from '../store/slices/admin'
import {
  login,
  signout,
  savePost,
  toggleMenu,
  toggleEdit,
  switchTab,
  loadingReferral,
  setReferralData,
  fetchNotifications,
  setRequestWithdrawal
} from '../store/slices/user'
import {
  setLoading,
  loadPosts,
  setPages,
  filterPosts,
  setSearchTerm,
  expandPost,
  setScrollPosition
} from '../store/slices/post'
import {useHistory as router} from 'react'
import Cookies from 'js-cookie'

const dispatch = store.dispatch



const fetchData = async (url, bearer, action) => {
  dispatch(setAdminLoading(true))
  try {
    const { data } = await axios.get(url, {
      headers: { authorization: `Bearer ${bearer}` }
    })
    dispatch(action(data))
    dispatch(setAdminLoading(false))
  } catch (err) {
    alert(err)
  }
}


const fetchReferralData = async (referralCode, email) => {
  dispatch(loadingReferral(true))
  try {
    const { data } = await axios.get(`/api/users/referrals?referralCode=${referralCode
      }&email=${email}`)
    dispatch(setReferralData(data))
    dispatch(loadingReferral(false))
  } catch (err) {
    alert(err)
  }
}

const initPosts = async () => {
  dispatch(setLoading(true))
  try {
    const { data } = await axios.get('/api/posts')
    dispatch(loadPosts(data.posts))
    dispatch(setPages(data.pages))
    dispatch(setLoading(false))
  } catch (err) {
    alert(err)
  }
}

const fetchPosts = async (page) => {
  try {
    const { data } = await axios.get(`/api/posts?page=${page}&limit=10`)
    dispatch(loadPosts(data.posts))
    dispatch(setPages(data.pages))
    dispatch(setLoading(false))
  } catch (err) {
    alert(err)
  }
}

const getPeriod = (totalMinutes) => {
  // const diffTime = Math.abs(new Date().valueOf() - new Date(date).valueOf())
    function padTo2Digits(num) {
    return num.toString().padStart(2, '0');
  }
    const minutes = totalMinutes % 60;
    const hours = Math.floor(totalMinutes / 60);
    return `${padTo2Digits(hours)}h ${padTo2Digits(minutes)}m`;
}

const numberWithCommas = (x) => {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')
}

const logoutHandler = () => {
  Cookies.remove('userInfo')
  // setTimeout(() => { dispatch(signout()) }, 1000)
  dispatch(signout())
  router.push('/sign-in')
}

export {
  fetchAdminMessages,
  fetchAdminUsers,
  setAdminLoading,
  setScrollPosition,
  login,
  filterPosts,
  signout,
  setSearchTerm,
  savePost,
  setLoading,
  expandPost,
  toggleMenu,
  setPages,
  toggleEdit,
  switchTab,
  loadingReferral,
  setReferralData,
  setRequestWithdrawal,
  fetchNotifications
}
export { fetchPosts, getPeriod, fetchData, initPosts, logoutHandler, fetchReferralData, numberWithCommas }
