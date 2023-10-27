'use client'

import { store } from '@app/_global/store/index'
import { Provider } from 'react-redux'

export function Providers({ children }: { children: React.ReactNode }) {
  return <Provider store={store}>{children}</Provider>
}
