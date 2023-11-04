'use client'
import { useRouter } from 'next/navigation'
import { logOut } from '@app/account/store/account.slice'
import { RootState, useAppSelector, useAppDispatch } from '@globalStore/index'

import Link from 'next/link'

const AccountMenu = () => {
  const { user } = useAppSelector((state: RootState) => state.account)
  const dispatch = useAppDispatch()
  const router = useRouter()
  return (
    <div className={`min-w-max p-6  border border-gray-200`}>
      <ul>
        <li className="pb-2">Welcome, {user.profile.firstName}</li>
        <li className="pb-2">
          <Link
            href="account/profile"
            className="hover:underline">
            Profile Info
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="account/address-book"
            className="hover:underline">
            Address Book
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="account/orders-returns"
            className="hover:underline">
            Orders & Returns
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="account/payment-options"
            className="hover:underline">
            Payment Options
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="account/wishlist"
            className="hover:underline">
            Wishlist
          </Link>
        </li>
        <li className="pb-2">
          <div
            onClick={() => {
              dispatch(logOut())
              router.push('/')
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
