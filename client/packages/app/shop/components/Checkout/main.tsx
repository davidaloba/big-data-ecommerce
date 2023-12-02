import { useContext } from 'react'
import { useForm } from 'react-hook-form'
import { RootState, useAppSelector } from '@globalStore/index'
import { CheckoutContext } from '.'
import OrderSummary from './order-summary'
import Information from './information'
import Shipping from './shipping'
import Billing from './biling'
import Link from 'next/link'

const Checkout = ({ paymentOptions, shippingOptions }) => {
  const [{ stage, shipping, errorMessage }, setCheckout] = useContext(CheckoutContext)
  const { userToken } = useAppSelector((state: RootState) => state.account)

  const {
    register,
    watch,
    setValue,
    formState: { errors }
  } = useForm({ mode: 'onBlur' })

  return !userToken ? (
    <section className="min-h-[50vh] flex flex-col justify-center items-center  pb-10 md:pb-20 pt-0 px-5 md:px-12 lg:px-16 2xl:px-20 ">
      <div className="py-4 bg-white text-center  uppercase ">
        You must be logged in to Checkout. click{' '}
        <Link
          className="underline"
          href="/account/login">
          here
        </Link>{' '}
        to proceed
      </div>
    </section>
  ) : (
    <section className="pb-10 md:pb-20 pt-0 px-5 md:px-12 lg:px-16 2xl:px-20 ">
      <div className="sticky md:top-[42px] xl:top-[68px] z-10 py-4 bg-white text-center text-red-500 uppercase ">
        {errorMessage}
      </div>
      <div className="flex flex-col  md:flex-row  justify-between items-start  ">
        <div
          className={` md:border-x md:mr-[10px] lg:mr-[30px] xl:mr-[50px] border-gray-200 w-full `}>
          <div className=" ">
            <div className=" md:sticky z-10 md:top-[74px] xl:top-[100px]  flex flex-row border-y bg-white">
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
                  setValue={setValue}
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
        <div className=" md:sticky md:top-[74px] xl:top-[100px]  min-w-full md:min-w-[35%] xl:min-w-[30%]">
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
