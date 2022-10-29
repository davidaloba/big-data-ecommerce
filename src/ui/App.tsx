import React from 'react'

// import type { RootState } from '../store'
// import { useAppSelector, useAppDispatch } from '../store'
// import { setLoading } from '../store/actions'

import '../assets/css/style.css'
import LayoutsRoute from './routes/layoutsroute'

const App = () => {
  // const posts = useAppSelector((state: RootState) => state.posts)
  // const dispatch = useAppDispatch()

  return (
    <div className="App">
      <LayoutsRoute />
    </div>
  )
}

export default App
