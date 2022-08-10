import { configureStore } from '@reduxjs/toolkit'
import {  combineReducers } from 'redux'

import admin from './slices/admin'
import user from './slices/user'
import posts from './slices/post'
const rootReducer = combineReducers({ admin, user, posts })

export const store = configureStore({
  reducer: rootReducer,
  devTools: true
})
