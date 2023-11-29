'use client'
import { RootState, useAppSelector } from '@app/_global/store/index'
import Link from 'next/link'
import WishListMenuItem from './wishlist-item'
import { useGetWishlistQuery } from '@app/account/store/wishlist.api'

const MenuWishlist = () => {
  const { openWishlist } = useAppSelector((state: RootState) => state.account)
  const { data: wishlist, isSuccess } = useGetWishlistQuery('wishlist')

  return (
    <div
      className={`${
        openWishlist ? 'block' : 'hidden'
      } group-hover:block fixed md:absolute w-screen md:w-[480px] top-[60px] md:top-6 right-0 px-4 md:px-0 border border-gray-200 bg-white uppercase`}>
      {isSuccess && wishlist.length < 1 ? (
        <div className="px-4 py-8">There are no items in your bag</div>
      ) : (
        <div className=" max-h-[50vh] overflow-y-scroll">
          {isSuccess &&
            wishlist &&
            wishlist.map((item, i) => (
              <WishListMenuItem
                key={i}
                item={item}
                i={i}
              />
            ))}
        </div>
      )}
      <div className="group/view">
        <Link
          href="/wishlist"
          className=" flex flex-row justify-between items-center px-4 py-2 ">
          <div className="group-hover/view:underline ">view wishlist</div>
          <div className=" text-lg">{`>`}</div>
        </Link>
      </div>
    </div>
  )
}

export default MenuWishlist
