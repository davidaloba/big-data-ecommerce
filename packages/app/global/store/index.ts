import { setupListeners } from '@reduxjs/toolkit/query/react'
import { configureStore } from '@reduxjs/toolkit'

import api from './api'
import global from './slice'
import products from '@modules/store/store/slice'
import articles from '@modules/blog/store/slice'

export const store = configureStore({
  reducer: { [api.reducerPath]: api.reducer, global, products, articles },
  middleware: (getDefaultMiddleware) =>
    getDefaultMiddleware().concat(api.middleware),
  devTools: true
})

setupListeners(store.dispatch)
