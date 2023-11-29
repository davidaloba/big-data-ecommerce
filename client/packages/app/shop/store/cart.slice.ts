import { createSlice } from '@reduxjs/toolkit'
import type { RootState } from '@app/_global/store/index'
import Cookies from 'js-cookie'
import { ICart } from '../__types'

const initialState: ICart = {
  items: Cookies.get('cart') ? JSON.parse(Cookies.get('cart')) : [],
  openCart: false
}

const cartSlice = createSlice({
  name: 'cart',
  initialState,
  extraReducers: (builder) => {},
  reducers: {
    addToCart: (cart, action) => {
      const existingItem = cart.items.find(
        (item) =>
          item.slug === action.payload.slug && item.selectedSize === action.payload.selectedSize
      )
      const existingItemIndex = cart.items.findIndex(
        (item) =>
          item.slug === action.payload.slug && item.selectedSize === action.payload.selectedSize
      )
      existingItem
        ? cart.items[existingItemIndex].qty++
        : (cart.items = [...cart.items, { ...action.payload, qty: 1 }])

      const cookie = JSON.stringify(cart.items)
      Cookies.set('cart', cookie)
    },
    removeFromCart: (cart, action) => {
      const existingItem = cart.items.find(
        (item) =>
          item.slug === action.payload.slug && item.selectedSize === action.payload.selectedSize
      )
      const existingItemIndex = cart.items.findIndex(
        (item) =>
          item.slug === action.payload.slug && item.selectedSize === action.payload.selectedSize
      )

      cart.items[existingItemIndex].qty > 1
        ? cart.items[existingItemIndex].qty--
        : (cart.items = [...cart.items.filter((item) => item !== existingItem)])

      const cookie = JSON.stringify(cart.items)
      Cookies.set('cart', cookie)
    },
    openCart: (cart, action) => {
      cart.openCart = action.payload
    }
  }
})

export const { addToCart, removeFromCart, openCart } = cartSlice.actions

export default cartSlice.reducer

// Other code such as selectors can use the imported `RootState` type
export const selectCount = (state: RootState) => state.cart
