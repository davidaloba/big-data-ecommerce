import { numberWithCommas } from '@globalUtils/index'

const OrderSummary = ({ subtotal, shippingCost, tax, total }) => {
  return (
    <>
      <div className=" md:flex flex-col  border-gray-200">
        <div className=" px-5 py-5 text-black border-b">
          <div className=" ">ORDER SUMMARY</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-2 ">
          <div className=" ">Subtotal</div>
          <div className=" ">${numberWithCommas(subtotal)}</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-2 ">
          <div className=" ">Shipping</div>
          <div className=" ">${numberWithCommas(shippingCost)}</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-2 border-b ">
          <div className=" ">VAT (7.5%)</div>
          <div className=" ">${numberWithCommas(tax)}</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-5 border-b ">
          <div className=" ">TOTAL</div>
          <div className=" ">${numberWithCommas(total)}</div>
        </div>
        <div className=" px-5 py-5 ">
          <div className="">Shipping from Lagos, Nigeria</div>
        </div>
      </div>
    </>
  )
}

export default OrderSummary
