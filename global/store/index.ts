import { setupListeners } from '@reduxjs/toolkit/query/react'
import { configureStore } from '@reduxjs/toolkit'

import api from './api'
import global from './actions'
import products from '@modules/products/store'
import users from '@modules/users/store'

export const store = configureStore({
  reducer: { [api.reducerPath]: api.reducer, global, products, users },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(api.middleware),
  devTools: true
})

setupListeners(store.dispatch)
