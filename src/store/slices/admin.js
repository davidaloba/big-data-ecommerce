import { createSlice } from '@reduxjs/toolkit'

const initialState = {
  loading: true,
  admins: null,
  messages: null,
}

const adminSlice = createSlice({
  name: 'admin',

  initialState,

  reducers: {
    setAdminLoading: (admin, action) => {
      admin.loading = false
    },
    fetchAdminUsers: (admin, action) => {
      admin.admins = action.payload
    },
    fetchAdminMessages: (admin, action) => {
      admin.messages = action.payload
    }
  }

})

export const {
  setAdminLoading,
  fetchAdminUsers,
  fetchAdminMessages
} = adminSlice.actions

// Other code such as selectors can use the imported `RootState` type
export const selectCount = (state) => state.admin

export default adminSlice.reducer
