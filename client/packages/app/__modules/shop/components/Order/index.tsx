import CartItems from './cart-items'
import OrderSummary from './order-summary'
import Address from '@appComponents/__lib/address'

const Order = ({ cart: items, billing, shipping, status }) => {
  const subtotal = items
    ? items.reduce((prev, current) => prev + current.price * current.qty, 0)
    : 0
  const tax = (7.5 / 100) * subtotal
  const cartCount =
    items && items.reduce((prev, current) => prev + current.qty, 0) !== 0
      ? items.reduce((prev, current) => prev + current.qty, 0)
      : 0
  const shippingCost = shipping && shipping.method ? shipping.method.cost : 0
  const total = subtotal + shippingCost + tax

  return (
    <section className=" pb-10 md:pb-20 pt-0 px-5 md:px-12 lg:px-16 2xl:px-20 ">
      <div className=" relative flex flex-col  md:flex-row  justify-between items-start ">
        <div
          className={` md:border-x md:mr-[10px] lg:mr-[30px] xl:mr-[50px] border-gray-200 w-full `}>
          <div className=" md:sticky  md:top-[42px] xl:top-[68px] flex flex-row justify-between items-center px-5 py-5 border-y bg-white ">
            <div className=" ">
              ORDER : {`${cartCount} ITEM${cartCount === 0 || cartCount > 1 ? 'S' : ''}`}
            </div>
          </div>
          {items && <CartItems cart={items} />}
        </div>
        {/* <div className=" sticky top-[68px]  md:block min-w-[35%] xl:min-w-[30%] md:mr-[10px] lg:mr-[30px] xl:mr-[50px]"></div> */}
        <div className=" md:sticky top-[68px]  min-w-full md:min-w-[35%] xl:min-w-[30%]">
          <div>
            <div className="  flex flex-row justify-between items-center px-5 py-5 border-t border-x bg-white ">
              <div className=" ">BILLING ADDRESS</div>
            </div>
            {billing && <Address address={billing.address} />}
          </div>
          <div className="mt-8">
            <div className="  flex flex-row justify-between items-center px-5 py-5 border-t border-x bg-white ">
              <div className=" ">SHIPPING ADDRESS</div>
            </div>
            {shipping && <Address address={shipping.address} />}
          </div>
          <div className="mt-8">
            <OrderSummary
              subtotal={subtotal}
              shippingCost={shippingCost}
              tax={tax}
              total={total}
              status={status}
            />
          </div>
        </div>
      </div>
    </section>
  )
}

export default Order
