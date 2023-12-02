import { getStrapiMedia, numberWithCommas } from '@globalUtils/index'
import Link from 'next/link'
import Image from 'next/image'

const OrderItems = ({ cart }) => {
  return (
    <div className="">
      {cart.map((item, i) => (
        <div
          key={i}
          className="flex flex-row justify-between px-5 py-5 border-b  ">
          <div className="flex flex-row">
            <Link
              className="w-[120px]"
              href={`/shop/${item.slug}`}>
              <Image
                src={getStrapiMedia(item.featuredImage)}
                alt="logo"
                width="120"
                height="0"
              />
            </Link>
            <div className="flex flex-col items-stretch justify-between ml-4 ">
              <Link href={`/shop/${item.slug}`}>
                <p className="">{item.name}</p>
              </Link>
              <div>
                <p className="">SIZE: {item.selectedSize}</p>
              </div>
              <p className="">QTY: {item.qty}</p>
            </div>
          </div>
          <div className="flex flex-col justify-between ">
            <p className="">${numberWithCommas(item.price)}</p>
            {item.qty > 1 && (
              <p className="  border-0 underline hover:no-underline py-1 uppercase">
                ${numberWithCommas(item.price * item.qty)}
              </p>
            )}
          </div>
        </div>
      ))}
    </div>
  )
}

export default OrderItems
