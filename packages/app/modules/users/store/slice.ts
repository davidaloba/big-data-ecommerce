import { createSlice, PayloadAction } from '@reduxjs/toolkit'
// import type { RootState } from '../'

interface IProducts {
  loading: boolean
}

const initialState: IProducts = {
  loading: true
}

const usersSlice = createSlice({
  name: 'users',

  initialState,

  reducers: {
    setLoading: (users, action: PayloadAction<boolean>) => {
      users.loading = action.payload
    }
  }
})

// export const selectProducts = (state: RootState) => state.users
export const { setLoading } = usersSlice.actions
export default usersSlice.reducer
