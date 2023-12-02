'use client'
import { useParams } from 'next/navigation'
import { useGetOrderQuery } from '@app/account/store/orders.api'

import Link from 'next/link'
import Address from '@globalComponents/__lib/address'
import OrderItems from './order-items'
import OrderSummary from './order-summary'

const Order = () => {
  const params = useParams()

  const { data: order } = useGetOrderQuery(params.id)

  return (
    <div className="border border-gray-200 pt-5 uppercase">
      <div className=" flex flex-row justify-between pb-4 border-b">
        <p className="flex-1 px-4">Order: {order?.slug}</p>
        <div className=" flex-1 ">STATUS: {order?.status}</div>
        <Link
          className="block  px-4"
          href="/account/orders-returns">
          <div>
            <span>{`<`}</span> Manage orders
          </div>
        </Link>
      </div>
      <div className=" relative flex flex-col  md:flex-row justify-between items-stretch">
        <div className={` border-gray-200 w-full `}>
          <div className=" flex flex-row justify-between items-center px-5 py-5 border-b  bg-white ">
            <div className=" ">
              ORDER :{' '}
              {`${order?.cart.length} ITEM${
                order?.cart.length === 0 || order?.cart.length > 1 ? 'S' : ''
              }`}
            </div>
          </div>
          {order?.cart && <OrderItems cart={order.cart} />}
        </div>
        <div className=" min-w-full md:min-w-[35%] xl:min-w-[30%] border-l">
          <div className="border-b">
            <div className=" flex flex-row justify-between items-center px-5 py-5 border-b  bg-white ">
              <div className=" ">BILLING ADDRESS</div>
            </div>
            {order?.billing && <Address address={order?.billing.address} />}
          </div>
          <div className="border-b">
            <div className=" flex flex-row justify-between items-center px-5 py-5 border-b bg-white ">
              <div className=" ">SHIPPING ADDRESS</div>
            </div>
            {order?.shipping && <Address address={order.shipping.address} />}
          </div>
          <div>
            {order && (
              <OrderSummary
                subtotal={order.billing.subtotal}
                shippingCost={order.shipping.method.cost}
                tax={order.billing.vat}
                total={order.billing.subtotal + order?.billing.vat}
              />
            )}
          </div>
        </div>
      </div>
    </div>
  )
}

export default Order
