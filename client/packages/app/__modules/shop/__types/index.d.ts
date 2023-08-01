import { Dispatch, SetStateAction } from 'react'

export interface ICart {
  items: object[]
  openCart?: boolean
}

export interface ICheckout {
  stage?: string
  shipping?: object
  billing?: object
  errorMessage?: string
}

export type CheckoutContextType = [
  checkout: ICheckout,
  setCheckout: Dispatch<SetStateAction<ICheckout>>
]

export interface IOrder {
  billing?: object
  shipping?: object
  cart?: Array<any>
  status?: string
}

export interface IProduct {
  attributes: any
  slug?
  name?
  featuredImage?
  hoverImage?
  category?
  price?
  color?
  size?
  gallery?
  description?
}
