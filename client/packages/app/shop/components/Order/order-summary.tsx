import { numberWithCommas } from '@app/_global/utils/index'
import Link from 'next/link'

const OrderSummary = ({ subtotal, shippingCost, tax, total, status }) => {
  return (
    <>
      <div className=" md:flex flex-col  border border-gray-200">
        <div className=" flex flex-row justify-between items-center px-5 py-5 text-black border-b">
          <div className=" ">ORDER SUMMARY</div>
          <div className="  ">STATUS: {status}</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-5 border-b">
          <div className="text-sm ">Shipping from Lagos, Nigeria</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-2  ">
          <div className=" ">Subtotal</div>
          <div className="  ">${numberWithCommas(subtotal)}</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-2  ">
          <div className=" ">Shipping</div>
          <div className="  ">${numberWithCommas(shippingCost)}</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-2 border-b ">
          <div className=" ">VAT (7.5%)</div>
          <div className="  ">${numberWithCommas(tax)}</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-5 border-b ">
          <div className=" ">TOTAL</div>
          <div className="  ">${numberWithCommas(total)}</div>
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
