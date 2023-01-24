import React from 'react'
import { Provider } from 'react-redux'
import { store } from '../store'

import { CommingSoon } from './commingsoon'

const Home = () => (
  <React.Fragment>
    <Provider store={store}>
      <CommingSoon />
    </Provider>
  </React.Fragment>
)

export default Home
