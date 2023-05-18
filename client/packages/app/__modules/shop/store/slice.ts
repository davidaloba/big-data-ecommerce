import { createSlice } from '@reduxjs/toolkit'
import type { RootState } from '@globalStore/index'
import Cookies from 'js-cookie'

const initialState: IShop = {
  cart: Cookies.get('cart') ? JSON.parse(Cookies.get('cart')) : [],
  openCart: false
}

const shopSlice = createSlice({
  name: 'shop',
  initialState,
  extraReducers: (builder) => {
    // builder.addCase(HYDRATE, (state, action) => {
    //   return {
    //     ...state,
    //     ...action.payload.shop
    //   }
    // })
  },
  reducers: {
    addToCart: (shop, action) => {
      const existingItem = shop.cart.find(
        (item) =>
          item.slug === action.payload.slug && item.selectedSize === action.payload.selectedSize
      )
      const existingItemIndex = shop.cart.findIndex(
        (item) =>
          item.slug === action.payload.slug && item.selectedSize === action.payload.selectedSize
      )
      existingItem
        ? shop.cart[existingItemIndex].qty++
        : (shop.cart = [...shop.cart, { ...action.payload, qty: 1 }])

      const cookie = JSON.stringify(shop.cart)
      Cookies.set('cart', cookie)
    },
    removeFromCart: (shop, action) => {
      const existingItem = shop.cart.find(
        (item) =>
          item.slug === action.payload.slug && item.selectedSize === action.payload.selectedSize
      )
      const existingItemIndex = shop.cart.findIndex(
        (item) =>
          item.slug === action.payload.slug && item.selectedSize === action.payload.selectedSize
      )

      shop.cart[existingItemIndex].qty > 1
        ? shop.cart[existingItemIndex].qty--
        : (shop.cart = [...shop.cart.filter((item) => item !== existingItem)])

      const cookie = JSON.stringify(shop.cart)
      Cookies.set('cart', cookie)
    },
    openCart: (shop, action) => {
      shop.openCart = action.payload
    }
  }
})

export const { addToCart, removeFromCart, openCart } = shopSlice.actions

export default shopSlice.reducer

// Other code such as selectors can use the imported `RootState` type
export const selectCount = (state: RootState) => state.shop
