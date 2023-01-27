import { createSlice, PayloadAction, createAsyncThunk } from '@reduxjs/toolkit'

// First, create the thunk
const fetchById = async (id) => {}
const fetchUserById = createAsyncThunk('users/fetchByIdStatus', async (userId, thunkAPI) => {
  const response = await fetchById(userId)
  return response.data
})
interface IProducts {
  loading: boolean
}

const initialState: IProducts = {
  loading: true
}

const productsSlice = createSlice({
  name: 'products',

  initialState,

  reducers: {
    setLoading: (products, action: PayloadAction<boolean>) => {
      products.loading = action.payload
    }
  },
  extraReducers: (builder) => {
    // Add reducers for additional action types here, and handle loading state as needed
    builder.addCase(fetchUserById.fulfilled, (state, action) => {
      // Add user to the state array
      state.products.push(action.payload)
    })
  }
})

// export const selectProducts = (state: RootState) => state.products
export const { setLoading } = productsSlice.actions
export default productsSlice.reducer
