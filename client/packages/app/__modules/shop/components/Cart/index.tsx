import { RootState, useAppSelector, useAppDispatch } from '@globalStore/index'
import Image from 'next/image'
import Link from 'next/link'
import { addToCart, removeFromCart } from '@appModules/shop/store/slice'
import { getStrapiMedia, numberWithCommas } from '@globalUtils/index'

const Cart = () => {
  const { cart } = useAppSelector((state: RootState) => state.shop)
  const cartCount =
    cart.reduce((prev, current) => prev + current.qty, 0) !== 0
      ? ` ${cart.reduce((prev, current) => prev + current.qty, 0)}`
      : 0

  const dispatch = useAppDispatch()

  return (
    <section className=" pb-10 md:pb-20 pt-1 px-6 md:px-12 lg:px-16 2xl:px-20 ">
      {cart.length < 1 ? (
        <div className="px-4 py-6 uppercase  text-center">
          There are no items in your sopping cart.
        </div>
      ) : (
        <div className="flex flex-col  md:flex-row gap-4 lg:gap-8 xl:gap-20 justify-between items-start ">
          <div className={` md:border border-gray-200 w-full `}>
            <div className=" flex flex-row justify-between items-center px-6 py-6 border-b ">
              <div className=" ">
                SHOPPING CART : {`${cartCount} ITEM${cartCount === 0 || cartCount > 1 ? 'S' : ''}`}
              </div>
              <div className="  "></div>
            </div>
            <div className="">
              {cart.map((item, i) => (
                <div
                  key={i}
                  className="flex flex-row justify-between px-6 py-6 border-b last:border-b-0 ">
                  <div className="flex flex-row">
                    <Link
                      className="w-[120px] md:w-[160px]"
                      href={`/shop/${item.slug}`}>
                      <Image
                        src={getStrapiMedia(item.featuredImage)}
                        alt="logo"
                        width="160"
                        height="0"
                      />
                    </Link>
                    <div className="flex flex-col  gap-6 ml-4 ">
                      <Link href={`/shop/${item.slug}`}>
                        <p className="">{item.name}</p>
                      </Link>
                      <div>
                        <p className="">SIZE: {item.selectedSize}</p>
                        <p className="">QTY: {item.qty}</p>
                      </div>
                    </div>
                  </div>
                  <div className="flex flex-col justify-between ">
                    <p className="">${numberWithCommas(item.price)}</p>
                    <div
                      className="  border-0 underline hover:no-underline py-1 uppercase"
                      onClick={() => {
                        dispatch(removeFromCart(item))
                      }}>
                      Remove
                    </div>
                  </div>
                </div>
              ))}
            </div>
            <div className="md:hidden flex flex-col ">
              <div className=" flex flex-row justify-between items-center px-6 py-6 border-t ">
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
                  className=" flex flex-row justify-between items-center px-6 py-4 border-t ">
                  <div className="hover:underline   text-white ">CHECKOUT</div>
                  <div className=" text-2xl  text-white">{`>`}</div>
                </Link>
              </div>
            </div>
            <div className=" px-6 py-6 border-t ">
              <p>
                Lorem ipsum dolor sit amet consectetur adipiscing elit lacus, sollicitudin consequat
                mauris condimentum cubilia primis parturient cursus, vitae cras faucibus lectus
                mollis nisi mattis.
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
          <div className="hidden md:block min-w-[35%] xl:min-w-[30%]">
            <div className=" md:flex flex-col  border border-gray-200">
              <div className=" flex flex-row justify-between items-center px-6 py-6 text-black">
                <div className=" ">ORDER SUMMARY</div>
              </div>
              <div className=" flex flex-row justify-between items-center px-6 py-6 border-t ">
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
                  className=" flex flex-row justify-between items-center px-6 py-4 border-t ">
                  <div className="hover:underline   text-white ">PROCEED T0 CHECKOUT</div>
                  <div className=" text-2xl  text-white">{`>`}</div>
                </Link>
              </div>
            </div>
            <Link href="/shop">
              <div className="py-4">
                <span>{`<`}</span> Continue shopping
              </div>
            </Link>
          </div>
        </div>
      )}
    </section>
  )
}

export default Cart
