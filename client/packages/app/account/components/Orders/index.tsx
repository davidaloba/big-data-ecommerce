'use client'
import { useGetOrdersQuery } from '@app/account/store/orders.api'
import OrderItem from './item'

export default function Profile() {
  const { data: orders, isSuccess } = useGetOrdersQuery('all')

  return (
    <div className="flex flex-col border border-gray-200 py-5 uppercase">
      <div className="pb-4 border-b">
        <p className="px-4">Order History</p>
      </div>
      {orders?.length < 1 ? (
        <div className="px-4 py-5 uppercase ">You haven't placed any orders</div>
      ) : (
        <div className="">
          {isSuccess &&
            orders?.map((item, i) => (
              <OrderItem
                key={i}
                item={item}
                i={i}
              />
            ))}
        </div>
      )}
    </div>
  )
}
