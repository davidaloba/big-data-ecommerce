import { createSlice } from '@reduxjs/toolkit'
import Cookies from 'js-cookie'

const initialState = {
  user: Cookies.get('user') ? JSON.parse(Cookies.get('user')) : null,
  userToken: Cookies.get('userToken') ? Cookies.get('userToken') : null,
  authModal: false
}

const authSlice = createSlice({
  name: 'auth',
  initialState,
  reducers: {
    setAuthModal: (auth, action) => {
      auth.authModal = action.payload
    },
    login: (auth, action) => {
      auth.user = action.payload.user
      auth.userToken = action.payload.jwt

      Cookies.set('user', JSON.stringify(action.payload.user))
      Cookies.set('userToken', action.payload.jwt)
    },
    logOut: (auth) => {
      Cookies.remove('user')
      Cookies.remove('userToken')

      auth.user = null
      auth.userToken = null
    }
  }
})

export const { setAuthModal, login, logOut } = authSlice.actions

export default authSlice.reducer
