import { useForm } from 'react-hook-form'
import { useContext } from 'react'
import OrderSummary from './order-summary'
import Information from './information'
import { CheckoutContext } from '.'
import Shipping from './shipping'
import Billing from './biling'

const Checkout = ({ paymentOptions, shippingOptions }) => {
  const [{ stage, shipping, errorMessage }, setCheckout] = useContext(CheckoutContext)

  const {
    register,
    watch,
    setValue,
    formState: { errors }
  } = useForm({ mode: 'onBlur' })

  return (
    <section className="pb-10 md:pb-20 pt-0 px-5 md:px-12 lg:px-16 2xl:px-20 ">
      <div className="sticky top-[68px] z-10 py-4 bg-white text-center text-red-500 uppercase ">
        {errorMessage}
      </div>
      <div className="flex flex-col  md:flex-row  justify-between items-start  ">
        <div
          className={` md:border-x md:mr-[10px] lg:mr-[30px] xl:mr-[50px] border-gray-200 w-full `}>
          <div className=" ">
            <div className=" sticky z-10 top-[100px] flex flex-row border-y bg-white">
              <button
                onClick={() => setCheckout((checkout) => ({ ...checkout, stage: 'info' }))}
                className={`flex-1  px-5 py-5 border-0 border-r hover:underline
                  ${stage === 'info' ? 'bg-gray-700 text-white underline' : ''}
                  `}>
                1. INFORMATION
              </button>
              <button
                disabled={shipping ? !shipping.address : true}
                onClick={() => setCheckout((checkout) => ({ ...checkout, stage: 'shipping' }))}
                className={`flex-1  px-5 py-5 border-0  border-r hover:underline disabled:hover:no-underline
                  ${stage === 'shipping' ? 'bg-gray-700 text-white underline' : ''}
                  `}>
                2. SHIPPING
              </button>
              <button
                disabled={shipping ? !shipping.address || !shipping.method : true}
                onClick={() => setCheckout((checkout) => ({ ...checkout, stage: 'billing' }))}
                className={`flex-1  px-5 py-5 border-0  border-r hover:underline disabled:hover:no-underline
                  ${stage === 'billing' ? 'bg-gray-700 text-white underline' : ''}
                  `}>
                3. PAYMENT
              </button>
            </div>
            <form className="border-b">
              {stage === 'info' && (
                <Information
                  register={register}
                  errors={errors.shipping && errors.shipping.address}
                />
              )}
              {stage === 'shipping' && (
                <Shipping
                  register={register}
                  shippingOptions={shippingOptions}
                />
              )}
              {stage === 'billing' && (
                <Billing
                  register={register}
                  errors={errors.billing}
                  watch={watch}
                  setValue={setValue}
                  paymentOptions={paymentOptions}
                />
              )}
            </form>
          </div>
        </div>
        <div className=" sticky top-[100px]  md:block min-w-[35%] xl:min-w-[30%]">
          <OrderSummary
            errors={errors}
            watch={watch}
          />
        </div>
      </div>
    </section>
  )
}

export default Checkout

// TODO: Create and handle SHIPPING and PAYMENT ON DELIVERY FORM
// TODO: Add ONLINE PAYMENT GATEWAY
// TODO: Handle SUBMIT FORM and ORDER CREATION with RTK QUERY MUTATION
