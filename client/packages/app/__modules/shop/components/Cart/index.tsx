import { RootState, useAppSelector } from '@globalStore/index'
import Link from 'next/link'
import { numberWithCommas } from '@globalUtils/index'
import { useEffect, useState } from 'react'
import OrderSummary from './order-summary'
import CartItems from './cart-items'

const Cart = () => {
  const { cart: data } = useAppSelector((state: RootState) => state.shop)

  const [subtotal, setSubtotal] = useState(0)
  const [cart, setCart] = useState([])
  const [cartCount, setCartCount] = useState(0)

  useEffect(() => {
    const cartCount =
      cart.reduce((prev, current) => prev + current.qty, 0) !== 0
        ? cart.reduce((prev, current) => prev + current.qty, 0)
        : 0
    setCartCount(cartCount)
    const count = cart.reduce((prev, current) => prev + current.price * current.qty, 0)
    setSubtotal(count)
    setCart(data)
  }, [])

  return cart.length < 1 ? (
    <section className=" pb-10 md:pb-20 pt-0 px-5 md:px-12 lg:px-16 2xl:px-20 ">
      <div className="px-4 py-5 uppercase  text-center">
        There are no items in your sopping cart.
      </div>
    </section>
  ) : (
    <section className=" pb-10 md:pb-20 pt-0 px-5 md:px-12 lg:px-16 2xl:px-20 ">
      <div className=" relative flex flex-col  md:flex-row  justify-between items-start ">
        <div
          className={` md:border-x md:mr-[10px] lg:mr-[30px] xl:mr-[50px] border-gray-200 w-full `}>
          <div className=" sticky top-[68px] flex flex-row justify-between items-center px-5 py-5 border-y bg-white ">
            <div className=" ">
              SHOPPING CART : {`${cartCount} ITEM${cartCount === 0 || cartCount > 1 ? 'S' : ''}`}
            </div>
            <div className="  "></div>
          </div>
          <CartItems cart={cart} />
          <div className="md:hidden flex flex-col ">
            <div className=" flex flex-row justify-between items-center px-5 py-5 border-t ">
              <div className=" ">SUBTOTAL</div>
              <div className="  ">
                $
                {numberWithCommas(
                  cart.reduce((prev, current) => prev + current.price * current.qty, 0)
                )}
              </div>
            </div>
            <div className=" bg-gray-700">
              <Link
                href="/checkout"
                className=" flex flex-row justify-between items-center px-5 py-4 border-t ">
                <div className="hover:underline   text-white ">CHECKOUT</div>
                <div className=" text-2xl  text-white">{`>`}</div>
              </Link>
            </div>
          </div>
          <div className=" px-5 py-5 border-t ">
            <p>
              Lorem ipsum dolor sit amet consectetur adipiscing elit lacus, sollicitudin consequat
              mauris condimentum cubilia primis parturient cursus, vitae cras faucibus lectus mollis
              nisi mattis.
            </p>
            <br />
            <p>
              Maecenas pretium convallis integer lacinia eget odio tempor taciti suspendisse
              rhoncus,
            </p>
            <br />
            <p>
              habitant vulputate ultricies ornare inceptos ut fermentum senectus cubilia dis diam,
              habitasse quis litora morbi eu enim aliquam lu
            </p>
          </div>
        </div>
        <div className=" sticky top-[68px]  md:block min-w-[35%] xl:min-w-[30%]">
          <OrderSummary subtotal={subtotal} />
        </div>
      </div>
    </section>
  )
}

export default Cart
