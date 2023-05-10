import { RootState, useAppSelector, useAppDispatch } from '@globalStore/index'
import Image from 'next/image'
import Link from 'next/link'
import { removeFromCart } from '@appModules/shop/store/slice'
import { getStrapiMedia, numberWithCommas } from '@globalUtils/index'
import { useEffect, useState } from 'react'

const MenuCart = () => {
  const { cart: data, openCart } = useAppSelector((state: RootState) => state.shop)
  const [subtotal, setSubtotal] = useState(0)
  const [cart, setCart] = useState([])
  useEffect(() => {
    const count = cart.reduce((prev, current) => prev + current.price * current.qty, 0)
    setSubtotal(count)
    setCart(data)
  }, [])

  const dispatch = useAppDispatch()

  return (
    <div
      className={`group-hover:block    ${
        openCart ? 'block' : 'hidden'
      } absolute border border-gray-200   w-[480px] top-6 right-0 bg-white`}>
      {cart.length < 1 ? (
        <div className="px-4 py-8">There are no items in your bag</div>
      ) : (
        <>
          <div className=" max-h-[50vh] overflow-y-scroll">
            {cart.map((item, i) => (
              <div
                key={i}
                className="flex flex-row justify-between px-4 py-6 ">
                <div className="flex flex-row">
                  <Link href={`/shop/${item.slug}`}>
                    <Image
                      src={getStrapiMedia(item.featuredImage)}
                      alt="logo"
                      width="120"
                      height="80"
                    />
                  </Link>
                  <div className="flex flex-col gap-1 ml-4">
                    <p>{item.name}</p>
                    <p>SIZE: {item.selectedSize}</p>
                    <p>QTY: {item.qty}</p>
                    <div
                      className=" border-0 underline hover:no-underline py-1 uppercase"
                      onClick={() => {
                        // dispatch(removeFromCart(item))
                      }}>
                      Remove
                    </div>
                  </div>
                </div>
                <p>${numberWithCommas(item.price)}</p>
              </div>
            ))}
          </div>
          <div className=" flex flex-row justify-between items-center px-4 py-6 border-t ">
            <div className=" ">SUBTOTAL</div>
            <div className=" "></div>
          </div>
          <div className="group/checkout bg-gray-700">
            <Link
              href="/checkout"
              className=" flex flex-row justify-between items-center px-4 py-2 border-t ">
              <div className="group-hover/checkout:underline  text-white ">CHECKOUT</div>
              <div className=" text-lg  text-white">{`>`}</div>
            </Link>
          </div>
        </>
      )}
      <div className="group/view">
        <Link
          href="/cart"
          className=" flex flex-row justify-between items-center px-4 py-2 border-t ">
          <div className="group-hover/view:underline ">VIEW BAG</div>
          <div className=" text-lg">{`>`}</div>
        </Link>
      </div>
    </div>
  )
}

export default MenuCart
