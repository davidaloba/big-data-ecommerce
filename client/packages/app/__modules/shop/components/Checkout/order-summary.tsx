import { getStrapiMedia, numberWithCommas } from '@globalUtils/index'
import Link from 'next/link'
import Image from 'next/image'
import { useContext, useState, useEffect } from 'react'
import { CheckoutContext } from '.'
import { RootState, useAppSelector } from '@globalStore/index'

const OrderSummary = ({ placeOrder, watch, errors }) => {
  const { cart: data } = useAppSelector((state: RootState) => state.shop)
  const [cart, setCart] = useState([])
  const [subtotal, setSubtotal] = useState(0)

  const [{ stage }, setCheckout] = useContext(CheckoutContext)

  useEffect(() => {
    const subtotal = data.reduce((prev, current) => prev + current.price * current.qty, 0)
    setSubtotal(subtotal)
    setCart(data)
  }, [])

  const cta = () => {
    if (stage === 'info') {
      if (errors.info || !watch('info.email')) {
        setCheckout((checkout) => ({
          ...checkout,
          errorMessage: 'Please fill in all required fields correctly'
        }))
      } else {
        setCheckout((checkout) => ({
          ...checkout,
          errorMessage: '',
          info: watch('info'),
          stage: 'shipping'
        }))
      }
    } else if (stage === 'shipping') {
      if (errors.info || errors.shipping || !watch('shipping')) {
        setCheckout((checkout) => ({
          ...checkout,
          errorMessage: 'Please fill in all required fields correctly'
        }))
      } else {
        setCheckout((checkout) => ({
          ...checkout,
          errorMessage: '',
          shipping: JSON.parse(watch('shipping')),
          stage: 'billing'
        }))
      }
    } else placeOrder()
  }

  return (
    <div className=" md:flex flex-col  border border-gray-200">
      <div className=" flex flex-row justify-between items-center px-5 py-5 text-black border-b">
        <div className=" ">ORDER SUMMARY</div>
      </div>
      <div className=" flex flex-row justify-between items-center px-5 py-5 border-b">
        <div className="text-sm ">Shipping from Lagos, Nigeria</div>
      </div>
      <div className=" max-h-[35vh] overflow-y-scroll">
        {cart.map((item, i) => (
          <div
            key={i}
            className="flex flex-row justify-between px-4 py-6 ">
            <div className="flex flex-row">
              <Link href={`/shop/${item.slug}`}>
                <Image
                  src={getStrapiMedia(item.featuredImage)}
                  alt="logo"
                  width="120"
                  height="80"
                />
              </Link>
              <div className="flex flex-col gap-2 ml-4">
                <p>{item.name}</p>
                <div>
                  <p>SIZE: {item.selectedSize}</p>
                  <p>QTY: {item.qty}</p>
                </div>
              </div>
            </div>
            <p>${numberWithCommas(item.price)}</p>
          </div>
        ))}
      </div>
      <div className=" flex flex-row justify-between items-center px-5 py-5  ">
        <div className=" ">Shipping</div>
        <div className="  ">${numberWithCommas(subtotal)}</div>
      </div>
      <div className=" flex flex-row justify-between items-center px-5 py-5 border-b ">
        <div className=" ">Domestic Taxes</div>
        <div className="  ">${numberWithCommas(subtotal)}</div>
      </div>
      <div className=" flex flex-row justify-between items-center px-5 py-5 border-b ">
        <div className=" ">TOTAL</div>
        <div className="  ">${numberWithCommas(subtotal)}</div>
      </div>
      <div className=" flex flex-row justify-between items-center px-5 py-3 border-t  bg-gray-700 ">
        <div
          onClick={() => cta()}
          className="grow hover:underline text text-center  text-white ">
          {`${stage === 'billing' ? 'PLACE ORDER' : 'SAVE AND CONTINUE'}`}
        </div>
        <div className=" text-2xl  text-white">{`>`}</div>
      </div>
    </div>
  )
}

export default OrderSummary
