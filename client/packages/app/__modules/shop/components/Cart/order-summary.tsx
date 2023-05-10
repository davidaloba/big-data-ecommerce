import { getStrapiMedia, numberWithCommas } from '@globalUtils/index'
import Link from 'next/link'
import Image from 'next/image'

const OrderSummary = ({ subtotal }) => {
  return (
    <>
      <div className=" md:flex flex-col  border border-gray-200">
        <div className=" flex flex-row justify-between items-center px-5 py-5 text-black">
          <div className=" ">ORDER SUMMARY</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-5 border-t ">
          <div className=" ">SUBTOTAL</div>
          <div className="  ">${numberWithCommas(subtotal)}</div>
        </div>
        <div className=" bg-gray-700">
          <Link
            href="/checkout"
            className=" flex flex-row justify-between items-center px-5 py-3 border-t ">
            <div className="hover:underline   text-white ">PROCEED T0 CHECKOUT</div>
            <div className=" text-2xl  text-white">{`>`}</div>
          </Link>
        </div>
      </div>
      <Link href="/shop">
        <div className="py-4">
          <span>{`<`}</span> Continue shopping
        </div>
      </Link>
    </>
  )
}

export default OrderSummary
