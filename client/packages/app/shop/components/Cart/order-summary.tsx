'use client'
import { numberWithCommas } from '@app/_global/utils/index'
import Link from 'next/link'
import { RootState, useAppDispatch, useAppSelector } from '@app/_global/store/index'
import { setAuthModal } from '@app/account/store/account.slice'

const OrderSummary = ({ subtotal }) => {
  const { userToken } = useAppSelector((state: RootState) => state.account)
  const dispatch = useAppDispatch()
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

        {userToken ? (
          <Link
            href="/checkout"
            className=" flex flex-row justify-between items-center px-4 py-2 border-t group/checkout bg-gray-700 ">
            <div className="group-hover/checkout:underline text-white ">CHECKOUT</div>
            <div className=" text-lg text-white">{`>`}</div>
          </Link>
        ) : (
          <div
            onClick={() => dispatch(setAuthModal(true))}
            className="flex flex-row justify-between items-center px-4 py-2 border-t group/checkout bg-gray-700 ">
            <div className="group-hover/checkout:underline text-white ">CHECKOUT</div>
            <div className=" text-lg text-white">{`>`}</div>
          </div>
        )}
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
