import { RootState, useAppSelector } from '@globalStore/index'
import { useForm } from 'react-hook-form'
import { useContext, useEffect, useState } from 'react'
import OrderSummary from './order-summary'
import InformationDetails from './information'
import { CheckoutContext } from '.'

// TODO: Optimize INFO FORM: validation, errors, etc.
// TODO: Create and handle SHIPPING and PAYMENT ON DELIVERY FORM
// TODO: Add ONLINE PAYMENT GATEWAY
// TODO: Handle SUBMIT FORM and ORDER CREATION with RTK QUERY MUTATION

const Checkout = () => {
  const { register, handleSubmit, getValues } = useForm({ mode: 'onBlur' })

  const [{ stage, info, shipping, billing }, setCheckout] = useContext(CheckoutContext)
  console.log(stage, info, shipping, billing)

  return (
    <section className="pb-10 md:pb-20 pt-0 px-5 md:px-12 lg:px-16 2xl:px-20 ">
      <div className="sticky top-[68px] z-10 py-4 bg-white "></div>
      <div className="flex flex-col  md:flex-row  justify-between items-start -z-10 ">
        <div
          className={` md:border-x md:mr-[10px] lg:mr-[30px] xl:mr-[50px] border-gray-200 w-full `}>
          <div className=" ">
            <div className=" sticky top-[100px] flex flex-row border-y bg-white">
              <button
                onClick={() => setCheckout((checkout) => ({ ...checkout, stage: 'info' }))}
                className={`flex-1  px-5 py-5 border-0 border-r hover:underline
                  ${stage === 'info' ? 'bg-gray-700 text-white underline' : ''}
                  `}>
                1. INFORMATION
              </button>
              <button
                onClick={() =>
                  info && setCheckout((checkout) => ({ ...checkout, stage: 'shipping' }))
                }
                className={`flex-1  px-5 py-5 border-0  border-r hover:underline
                  ${stage === 'shipping' ? 'bg-gray-700 text-white underline' : ''}
                  ${!info && 'hover:no-underline'}
                  `}>
                2. SHIPPING
              </button>
              <button
                onClick={() =>
                  info && setCheckout((checkout) => ({ ...checkout, stage: 'billing' }))
                }
                className={`flex-1  px-5 py-5 border-0  border-r hover:underline
                  ${stage === 'billing' ? 'bg-gray-700 text-white underline' : ''}
                  ${!info && 'hover:no-underline'}
                  `}>
                3. PAYMENT
              </button>
            </div>
            <form className="border-b">
              {stage === 'info' && <InformationDetails register={register} />}
            </form>
          </div>
        </div>
        <div className=" sticky top-[100px]  md:block min-w-[35%] xl:min-w-[30%]">
          <OrderSummary
            handleSubmit={handleSubmit}
            getValues={getValues}
          />
        </div>
      </div>
    </section>
  )
}

export default Checkout
