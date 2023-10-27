import Link from 'next/link'
import Image from 'next/image'
import { getStrapiMedia, numberWithCommas } from '@app/_global/utils/index'
import { useAppDispatch } from '@app/_global/store/index'
import { removeFromCart } from '../../store/cart.slice'

const CartItems = ({ cart }) => {
  const dispatch = useAppDispatch()

  return (
    <div className="">
      {cart.map((item, i) => (
        <div
          key={i}
          className="flex flex-row justify-between px-5 py-5 border-b last:border-b-0 ">
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
  )
}

export default CartItems
