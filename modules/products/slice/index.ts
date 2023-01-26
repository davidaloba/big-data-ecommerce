import { createSlice, PayloadAction } from '@reduxjs/toolkit'
// import type { RootState } from '../'

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
  }
})

// export const selectProducts = (state: RootState) => state.products
export const { setLoading } = productsSlice.actions
export default productsSlice.reducer
