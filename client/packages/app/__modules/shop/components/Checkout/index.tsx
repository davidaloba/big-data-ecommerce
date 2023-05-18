import { Dispatch, SetStateAction, createContext, useState } from 'react'
import Checkout from './main'

interface ICheckout {
  stage?: string
  info?: object
  shipping?: object
  billing?: object
  errorMessage?: string
}

export type CheckoutContextType = [
  checkout: ICheckout,
  setCheckout: Dispatch<SetStateAction<ICheckout>>
]

const CheckoutContext = createContext<CheckoutContextType>([
  {
    stage: 'info',
    info: null,
    shipping: null,
    billing: null,
    errorMessage: null
  },
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  () => {}
])

const CheckoutProvider = ({ children }) => {
  const [checkout, setCheckout] = useState<ICheckout>({
    stage: 'info',
    info: null,
    shipping: null,
    billing: null
  })
  return (
    <CheckoutContext.Provider value={[checkout, setCheckout]}>{children}</CheckoutContext.Provider>
  )
}

export { CheckoutProvider, CheckoutContext }

const CheckoutMain = () => {
  return (
    <CheckoutProvider>
      <Checkout />
    </CheckoutProvider>
  )
}

export default CheckoutMain
