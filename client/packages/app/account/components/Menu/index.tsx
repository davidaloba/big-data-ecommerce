'use client'
import { usePathname } from 'next/navigation'
import { logOut } from '@app/account/store/auth.slice'
import { useAppDispatch } from '@globalStore/index'

import Link from 'next/link'

const AccountMenu = () => {
  const pathname = usePathname()
  const dispatch = useAppDispatch()

  return (
    <div className={`min-w-max p-3 uppercase`}>
      <ul>
        <li className="pb-2">
          <Link
            href="/account/profile"
            className={pathname === '/account/profile' ? 'underline' : 'hover:underline'}>
            Profile Info
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="/account/address-book"
            className={pathname === '/account/address-book' ? 'underline' : 'hover:underline'}>
            Address Book
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="/account/orders-returns"
            className={pathname === '/account/orders-returns' ? 'underline' : 'hover:underline'}>
            Orders & Returns
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="/account/payment-options"
            className={pathname === '/account/payment-options' ? 'underline' : 'hover:underline'}>
            Payment Options
          </Link>
        </li>
        <li className="pb-2">
          <Link
            href="/account/wishlist"
            className={pathname === '/account/wishlist' ? 'underline' : 'hover:underline'}>
            Wishlist
          </Link>
        </li>
        <li className="mt-8 pb-2">
          <div
            onClick={() => {
              dispatch(logOut())
            }}
            className={pathname === '/account/profile' ? 'underline' : 'hover:underline'}>
            Log out
          </div>
        </li>
      </ul>
    </div>
  )
}

export default AccountMenu
