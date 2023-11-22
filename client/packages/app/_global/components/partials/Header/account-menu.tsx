'use client'
import { logOut } from '@app/account/store/auth.slice'
import { RootState, useAppSelector, useAppDispatch } from '@globalStore/index'

import Link from 'next/link'

const AccountMenu = () => {
  const { user } = useAppSelector((state: RootState) => state.auth)
  const dispatch = useAppDispatch()
  return (
    <div
      className={`hidden group-hover:block fixed md:absolute min-w-max top-[60px] md:top-6 right-0 p-6  border border-gray-200 bg-white`}>
      <ul>
        <li className="pb-2">Welcome, {user.firstName}</li>
        <li className="pb-2">
          <Link
            href="/account/profile"
            className="hover:underline">
            Profile Info
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="/account/address-book"
            className="hover:underline">
            Address Book
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="/account/orders-returns"
            className="hover:underline">
            Orders & Returns
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="/account/payment-options"
            className="hover:underline">
            Payment Options
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="/account/wishlist"
            className="hover:underline">
            Wishlist
          </Link>
        </li>
        <li className="pb-2">
          <div
            onClick={() => {
              dispatch(logOut())
            }}
            className="hover:underline">
            Log out
          </div>
        </li>
      </ul>
    </div>
  )
}

export default AccountMenu
