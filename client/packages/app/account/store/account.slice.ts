import { createSlice } from '@reduxjs/toolkit'
import Cookies from 'js-cookie'

const initialState = {
  userToken: Cookies.get('userToken') ? Cookies.get('userToken') : null,
  authModal: false,
  openWishlist: false
}

const accountSlice = createSlice({
  name: 'account',
  initialState,
  reducers: {
    setAuthModal: (account, action) => {
      account.authModal = action.payload
    },
    setEdit: (profile, action) => {
      profile.edit = action.payload
    },
    login: (account, action) => {
      account.userToken = action.payload.jwt
      if (action.payload.remainLoggedIn) {
        Cookies.set('userToken', action.payload.jwt, { expires: 7 })
      } else {
        Cookies.set('userToken', action.payload.jwt)
      }
    },
    logOut: (account) => {
      Cookies.remove('userToken')
      Cookies.remove('wishlist')
      account.userToken = null
    },
    openWishlist: (account, action) => {
      account.openWishlist = action.payload
    }
  }
})

export const { login, logOut, setAuthModal, openWishlist } = accountSlice.actions

export default accountSlice.reducer
