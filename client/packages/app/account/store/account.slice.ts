import { createSlice } from '@reduxjs/toolkit'
import type { RootState } from '@app/_global/store/index'
import Cookies from 'js-cookie'

const initialState = {
  user: Cookies.get('user') ? JSON.parse(Cookies.get('user')) : null,
  authModal: false
}

const accountSlice = createSlice({
  name: 'account',
  initialState,
  extraReducers: (builder) => {
    // builder.addCase(HYDRATE, (state, action) => {
    //   return {
    //     ...state,
    //     ...action.payload
    //   }
    // })
  },
  reducers: {
    setAuthModal: (account, action) => {
      account.authModal = action.payload
    },
    login: (account, action) => {
      // account.user = action.payload
      account.user = { profile: { firstName: 'David' } }
    },
    logOut: (account) => {
      account.user = null
    }
  }
})

export const { setAuthModal, login, logOut } = accountSlice.actions

export default accountSlice.reducer

// Other code such as selectors can use the imported `RootState` type
export const selectCount = (state: RootState) => state
