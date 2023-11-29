'use client'
import WishlistItem from './item'
import { useGetWishlistQuery } from '@app/account/store/wishlist.api'

const Wishlist = () => {
  const { data: wishlist, isSuccess } = useGetWishlistQuery('wishlist')

  return (
    <div className="flex flex-col border border-gray-200 py-5 uppercase">
      <div className="pb-4 border-b">
        <p className="px-4">Saved Items</p>
      </div>
      {wishlist && wishlist.length < 1 ? (
        <div className="px-4 py-5 uppercase ">There are no items in your wishlist.</div>
      ) : (
        <div className="">
          {isSuccess &&
            wishlist.map((item, i) => (
              <WishlistItem
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

export default Wishlist
