import { Dispatch, SetStateAction, createContext, useState } from 'react'
import Checkout from './main'

interface ICheckout {
  stage?: string
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
    errorMessage: null,
    shipping: null,
    billing: null
  },
  // eslint-disable-next-line @typescript-eslint/no-empty-function
  () => {}
])

const CheckoutProvider = ({ children }) => {
  const [checkout, setCheckout] = useState<ICheckout>({
    stage: 'info',
    shipping: null,
    billing: null
  })
  return (
    <CheckoutContext.Provider value={[checkout, setCheckout]}>{children}</CheckoutContext.Provider>
  )
}

export { CheckoutProvider, CheckoutContext }

const shippingOptions = [
  {
    name: 'Express Delivery',
    cost: 5000,
    duration: '1 - 3 business days'
  },
  {
    name: 'Standard Delivery',
    cost: 3000,
    duration: '5 - 7 business days'
  }
]

const paymentOptions = [
  {
    name: 'FlutterWave'
  }
]

const CheckoutMain = () => {
  return (
    <CheckoutProvider>
      <Checkout
        paymentOptions={paymentOptions}
        shippingOptions={shippingOptions}
      />
    </CheckoutProvider>
  )
}

export default CheckoutMain
