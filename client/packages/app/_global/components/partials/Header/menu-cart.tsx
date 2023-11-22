'use client'
import { RootState, useAppSelector, useAppDispatch } from '@app/_global/store/index'
import Image from 'next/image'
import Link from 'next/link'
import { removeFromCart } from '@app/shop/store/cart.slice'
import { setAuthModal } from '@app/account/store/auth.slice'
import { getStrapiMedia, numberWithCommas } from '@app/_global/utils/index'
import { useEffect, useState } from 'react'

const MenuCart = () => {
  const { items: cart, openCart } = useAppSelector((state: RootState) => state.cart)
  const { user } = useAppSelector((state: RootState) => state.auth)
  const [subtotal, setSubtotal] = useState(0)
  const [items, setItems] = useState([])
  useEffect(() => {
    setItems(cart)
    const subtotal = cart && cart.reduce((prev, current) => prev + current.price * current.qty, 0)
    setSubtotal(subtotal)
  }, [cart, items])

  const dispatch = useAppDispatch()

  return (
    <div
      className={`group-hover:block fixed md:absolute w-screen md:w-[480px] top-[60px] md:top-6 right-0 px-4 md:px-0 ${
        openCart ? 'block' : 'hidden'
      } border border-gray-200 bg-white`}>
      {items && items.length < 1 ? (
        <div className="px-4 py-8">There are no items in your bag</div>
      ) : (
        <>
          <div className=" max-h-[50vh] overflow-y-scroll">
            {items &&
              items.map((item, i) => (
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
                          dispatch(removeFromCart(item))
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
            <div className=" ">${numberWithCommas(subtotal)}</div>
          </div>
          {user ? (
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
