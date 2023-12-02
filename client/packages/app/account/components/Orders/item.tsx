'use client'
import Link from 'next/link'
import { numberWithCommas } from '@app/_global/utils/index'

const OrderItem = ({ item, i }) => {
  const { slug, cart, shipping, status, billing } = item

  return (
    <div
      key={i}
      className="flex flex-row justify-between px-5 py-5 border-b uppercase">
      <div className="flex flex-col grow justify-between gap-3  ">
        <p>ORDER ID: {slug}</p>
        <div className="flex flex-col  gap-1">
          <p>Item No.: {cart.length}</p>
          <p>Shipping: {shipping.method.name}</p>
          <p>Payment: {billing.payment.status}</p>
        </div>
        <p>Order Status: {status}</p>
      </div>
      <div className="flex flex-col justify-between ">
        <p>${numberWithCommas(billing.subtotal + billing.vat)}</p>
        <Link
          className="underline hover:no-underline text-right"
          href={`/account/order/${slug}`}>
          View
        </Link>
      </div>
    </div>
  )
}

export default OrderItem
