import { getStrapiMedia, numberWithCommas } from '@globalUtils/index'
import Link from 'next/link'
import Image from 'next/image'
import Cookies from 'js-cookie'
import { useContext, useState, useEffect } from 'react'
import { CheckoutContext } from '.'
import { RootState, useAppSelector } from '@globalStore/index'
import { useFlutterwave, closePaymentModal } from 'flutterwave-react-v3'
import { useRouter } from 'next/router'
import { useAddOrderMutation } from '@appModules/shop/store/orders.api'

const OrderSummary = ({ watch, errors }) => {
  const [addOrder, { isSuccess }] = useAddOrderMutation()

  const router = useRouter()

  const [checkout, setCheckout] = useContext(CheckoutContext)
  const { stage, shipping, billing } = checkout

  const { items } = useAppSelector((state: RootState) => state.cart)
  const [cart, setCart] = useState([])
  const [subtotal, setSubtotal] = useState(0)
  const [shippingCost, setShippingCost] = useState(0)
  const [tax, setTax] = useState(0)
  const [total, setTotal] = useState(0)
  useEffect(() => {
    const subtotal = items.reduce((prev, current) => prev + current.price * current.qty, 0)
    const tax = (7.5 / 100) * subtotal
    setCart(items)
    setShippingCost(shipping && shipping.method ? shipping.method.cost : 0)
    setSubtotal(subtotal)
    setTax(tax)
    setTotal(subtotal + shippingCost + tax)
  }, [shipping, items])

  const handleFlutterPayment = useFlutterwave({
    public_key: 'FLWPUBK_TEST-df0e4fa63e812a62a238d5e6fa9f4f8a-X',
    tx_ref: `${Date.now()}`,
    currency: 'NGN',
    payment_options: 'card,mobilemonesy,ussd',
    customizations: {
      title: 'Yinka Samuels Checkout',
      description: '',
      logo: '/logo.png'
    },
    customer: {
      email: billing && billing.address && billing.address.email,
      phone_number: billing && billing.address && billing.address.phone,
      name:
        billing && billing.address && `${billing.address.firstName} ${billing.address.firstName}`
    },
    amount: total
  })

  const placeOrder = () => {
    handleFlutterPayment({
      callback: async (response) => {
        if (response.status === 'successful') {
          try {
            const order = {
              cart: cart,
              billing: {
                ...billing,
                payment: {
                  ...billing.payment,
                  _ref: response.flw_ref,
                  status: response.status,
                  tx_ref: response.tx_ref,
                  transaction_id: response.transaction_id
                }
              },
              shipping
            }
            addOrder(order)
          } catch (err) {
            alert(err)
          }
          closePaymentModal() // this will close the modal programmatically
          router.push(`/order/${response.transaction_id}`)
          Cookies.remove('cart')
        } else {
          alert(` Your payment is ${response.status}.Please try again later`)
          return
        }
      },
      onClose: () => {
        // handle payment cancellation
      }
    })
  }

  const cta = () => {
    if (stage === 'info') {
      if ((errors.shipping && errors.shipping.address) || !watch('shipping.address.email')) {
        setCheckout((checkout) => ({
          ...checkout,
          errorMessage: 'Please fill in all required fields correctly'
        }))
      } else {
        setCheckout((checkout) => ({
          ...checkout,
          errorMessage: '',
          shipping: { ...shipping, address: watch('shipping.address') },
          stage: 'shipping'
        }))
      }
    } else if (stage === 'shipping') {
      if (
        !watch('shipping.method') ||
        (errors.shipping && (errors.shipping.method || errors.shipping))
      ) {
        setCheckout((checkout) => ({
          ...checkout,
          errorMessage: 'Please fill in all required fields correctly'
        }))
      } else {
        setCheckout((checkout) => ({
          ...checkout,
          errorMessage: '',
          shipping: { ...shipping, method: JSON.parse(watch('shipping.method')) },
          stage: 'billing',
          billing: {
            ...billing,
            subtotal: subtotal,
            vat: tax
          }
        }))
      }
    } else if (errors.billing) {
      setCheckout((checkout) => ({
        ...checkout,
        errorMessage: 'Please fill in all required fields correctly'
      }))
    } else {
      setCheckout((checkout) => ({
        ...checkout,
        errorMessage: ''
      }))
      placeOrder()
    }
  }
  return (
    <div className=" flex flex-col-reverse md:flex-col  border border-gray-200">
      <div className=" md:flex flex-col ">
        <div className=" flex flex-row justify-between items-center px-5 py-5 text-black border-b">
          <div className=" ">ORDER SUMMARY</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-5 border-b">
          <div className="text-sm ">Shipping from Lagos, Nigeria</div>
        </div>
        <div className=" md:max-h-[35vh] overflow-y-scroll">
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
                <div className="flex flex-col gap-2 ml-4">
                  <p>{item.name}</p>
                  <div>
                    <p>SIZE: {item.selectedSize}</p>
                    <p>QTY: {item.qty}</p>
                  </div>
                </div>
              </div>
              <p>${numberWithCommas(item.price)}</p>
            </div>
          ))}
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-2  ">
          <div className=" ">Subtotal</div>
          <div className="  ">${numberWithCommas(subtotal)}</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-2  ">
          <div className=" ">Shipping</div>
          <div className="  ">${numberWithCommas(shippingCost)}</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-2 border-b ">
          <div className=" ">VAT (7.5%)</div>
          <div className="  ">${numberWithCommas(tax)}</div>
        </div>
        <div className=" flex flex-row justify-between items-center px-5 py-5 border-b ">
          <div className=" ">TOTAL</div>
          <div className="  ">${numberWithCommas(total)}</div>
        </div>
      </div>
      <div className=" flex flex-row justify-between items-center px-5 py-3 border-t  bg-gray-700 ">
        <div
          onClick={() => cta()}
          className="grow hover:underline text text-center  text-white ">
          {`${stage === 'billing' ? 'PLACE ORDER' : 'SAVE AND CONTINUE'}`}
        </div>
        <div className=" text-2xl  text-white">{`>`}</div>
      </div>
    </div>
  )
}

export default OrderSummary
