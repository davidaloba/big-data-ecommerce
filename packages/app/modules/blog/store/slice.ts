import { createSlice, PayloadAction, createAsyncThunk } from '@reduxjs/toolkit'

// First, create the thunk
const fetchById = async (id) => {
  return {}
}
const fetchUserById = createAsyncThunk(
  'users/fetchByIdStatus',
  async (userId, thunkAPI) => {
    const response = await fetchById(userId)
    return response.data
  }
)
interface IProducts {
  loading: boolean
  store: []
}

const initialState: IProducts = {
  loading: true,
  store: []
}

const productsSlice = createSlice({
  name: 'store',

  initialState,

  reducers: {
    setLoading: (store, action: PayloadAction<boolean>) => {
      store.loading = action.payload
    }
  },
  extraReducers: (builder) => {
    // Add reducers for additional action types here, and handle loading state as needed
    builder.addCase(fetchUserById.fulfilled, (state, action) => {
      // Add user to the state array
      state.store.push(action.payload)
    })
  }
})

// export const selectProducts = (state: RootState) => state.store
export const { setLoading } = productsSlice.actions
export default productsSlice.reducer
