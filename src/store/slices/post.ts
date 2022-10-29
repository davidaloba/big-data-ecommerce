import { createSlice, PayloadAction } from '@reduxjs/toolkit'
// import type { RootState } from '../'

interface IPosts {
  loading: boolean
}

const initialState: IPosts = {
  loading: true
}

const postsSlice = createSlice({
  name: 'posts',

  initialState,

  reducers: {
    setLoading: (posts, action: PayloadAction<boolean>) => {
      posts.loading = action.payload
    }
  }
})

// export const selectPosts = (state: RootState) => state.posts
export const { setLoading } = postsSlice.actions
export default postsSlice.reducer
