import { createSlice, PayloadAction } from '@reduxjs/toolkit'
// import type { RootState } from '../'

interface IGlobal {
  loading: boolean
}

const initialState: IGlobal = {
  loading: true
}

const globalSlice = createSlice({
  name: 'global',

  initialState,

  reducers: {
    setLoading: (global, action: PayloadAction<boolean>) => {
      global.loading = action.payload
    }
  }
})

// export const selectGlobal = (state: RootState) => state.global
export const { setLoading } = globalSlice.actions
export default globalSlice.reducer
