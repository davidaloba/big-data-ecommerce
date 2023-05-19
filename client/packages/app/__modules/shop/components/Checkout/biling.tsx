import { useContext, useEffect, useState } from 'react'
import { CheckoutContext } from '.'

const Billing = ({ register, watch, paymentOptions, errors, setValue }) => {
  const [checkout, setCheckout] = useContext(CheckoutContext)
  const { shipping, billing } = checkout
  const [billingAdd, setBillingAdd] = useState(true)

  const firstNameErr = (errors && errors.firstName && errors.firstName) || null
  const lastNameErr = (errors && errors.lastName && errors.lastName) || null
  const emailErr = (errors && errors.email && errors.email) || null
  const countryErr = (errors && errors.country && errors.country) || null
  const addressLine1Err = (errors && errors.addressLine1 && errors.addressLine1) || null
  const addressLine2Err = (errors && errors.addressLine2 && errors.addressLine2) || null
  const cityErr = (errors && errors.city && errors.city) || null
  const stateErr = (errors && errors.state && errors.state) || null
  const zipCodeErr = (errors && errors.zipCode && errors.zipCode) || null
  const phoneErr = (errors && errors.phone && errors.phone) || null

  const registerOptions = {
    paymentMethod: {
      required: 'Payment method is required'
    },
    firstName: {
      required: 'First Name is required',
      minLength: {
        value: 1,
        message: 'First Name must have at least 1 character'
      },
      maxLength: {
        value: 45,
        message: 'First Name must have no more than 45 characters'
      }
    },
    lastName: {
      required: 'Last Name is required',
      minLength: {
        value: 1,
        message: 'Last Name must have at least 1 character'
      },
      maxLength: {
        value: 45,
        message: 'Last Name must have no more than 45 characters'
      }
    },
    email: {
      required: 'Email is required',
      minLength: {
        value: 1,
        message: 'Email must have at least 1 character'
      },
      pattern: {
        value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i,
        message: 'Invalid email address'
      }
    },
    country: { required: 'Country is required' },
    addressLine1: {
      required: 'Street Line is required',
      minLength: {
        value: 1,
        message: 'Street Line must have at least 1 character'
      },
      maxLength: {
        value: 250,
        message: 'Street Line must have no more than 45 characters'
      }
    },
    addressLine2: {
      minLength: {
        value: 0,
        message: 'Street Line 2 must have at least 1 character'
      },
      maxLength: {
        value: 500,
        message: 'Street Line 2 must have no more than 45 characters'
      }
    },
    city: {
      required: 'City is required',
      minLength: {
        value: 1,
        message: 'City must have at least 1 character'
      },
      maxLength: {
        value: 150,
        message: 'City must have no more than 45 characters'
      }
    },
    zipCode: {
      required: 'Zip Code is required',
      minLength: {
        value: 1,
        message: 'Zip Code must have at least 1 character'
      },
      maxLength: {
        value: 50,
        message: 'Zip Code must have no more than 45 characters'
      }
    },
    state: {
      minLength: {
        value: 0,
        message: 'Zip Code must have at least 1 character'
      },
      maxLength: {
        value: 150,
        message: 'Zip Code must have no more than 45 characters'
      }
    },
    phone: {
      required: 'Phone is required',
      minLength: {
        value: 1,
        message: 'Phone must have at least 1 character'
      },
      maxLength: {
        value: 50,
        message: 'Phone must have no more than 45 characters'
      }
    }
  }

  useEffect(() => {
    setCheckout((checkout) => ({
      ...checkout,
      errorMessage: '',
      billing: { ...billing, address: watch('billing.address') }
    }))
  }, [watch('billing.address')])

  return (
    <div>
      <div className=" px-5 py-5 ">
        <p className=" pb-5 uppercase ">select billing address</p>
        <div className="pb-5 flex ">
          <input
            type="checkbox"
            value={watch('shipping.address')}
            className=" mr-6 cursor-pointer"
            onClick={() => {
              setBillingAdd(!billingAdd)
              setValue('billing.address', shipping.address, {
                shouldValidate: true,
                shouldDirty: true,
                shouldTouch: true
              })
              console.log(watch('billing.address'))
            }}
          />
          <label className=" min-w-max uppercase">Same as shipping address</label>
        </div>
        {billingAdd ? (
          <div>
            <div className=" flex flex-row gap-5 pb-5">
              <div className="flex-1 flex flex-col ">
                <div className="flex flex-row justify-between items-center">
                  <label className=" mb-1 uppercase">First Name</label>
                  {firstNameErr && <p className="text-red-500 uppercase">{firstNameErr.message}</p>}
                </div>
                <input
                  {...register('billing.address.firstName', registerOptions.firstName)}
                  type="text"
                  autoFocus
                  className={` invalid:border-red-500 ${firstNameErr && 'border-red-500'}`}
                />
              </div>
              <div className="flex-1 flex flex-col ">
                <div className="flex flex-row justify-between items-center">
                  <label className=" mb-1 uppercase">Last Name</label>
                  {lastNameErr && <p className="text-red-500 uppercase">{lastNameErr.message}</p>}
                </div>
                <input
                  type="text"
                  {...register('billing.address.lastName', registerOptions.lastName)}
                  className={` invalid:border-red-500 ${lastNameErr && 'border-red-500'}`}
                />
              </div>
            </div>
            <div className="pb-5 flex flex-col ">
              <div className="flex flex-row justify-between items-center">
                <label className=" mb-1 uppercase">E-mail</label>
                {emailErr && <p className="text-red-500 uppercase">{emailErr.message}</p>}
              </div>
              <input
                type="email"
                {...register('billing.address.email', registerOptions.email)}
                className={` invalid:border-red-500 ${emailErr && 'border-red-500'}`}
              />
            </div>
            <div className="pb-5 flex flex-col ">
              <div className="flex flex-row justify-between items-center">
                <label
                  aria-live="assertive"
                  role="alert"
                  className="mb-1 uppercase ">
                  Country/Region
                </label>
                {countryErr && <p className="text-red-500 uppercase">{countryErr.message}</p>}
              </div>
              <input
                type="dropdown"
                {...register('billing.address.country', registerOptions.country)}
                className={` invalid:border-red-500 ${countryErr && 'border-red-500'}`}>
                {/* ADDRESS DROPDOWN */}
              </input>
            </div>
            <div className="  pb-5 flex flex-col ">
              <div className="flex flex-row justify-between items-center">
                <label className=" mb-1 uppercase">street line</label>
                {addressLine1Err && (
                  <p className="text-red-500 uppercase">{addressLine1Err.message}</p>
                )}
              </div>
              <input
                type="text"
                {...register('billing.address.addressLine1', registerOptions.addressLine1)}
                className={` invalid:border-red-500 ${addressLine1Err && 'border-red-500'}`}
              />
            </div>
            <div className="pb-5 flex flex-col ">
              <div className="flex flex-row justify-between items-center">
                <label className=" mb-1 uppercase">street line 2</label>
                {addressLine2Err && (
                  <p className="text-red-500 uppercase">{addressLine2Err.message}</p>
                )}
              </div>
              <input
                {...register('billing.address.addressLine2', registerOptions.addressLine2)}
                type="text"
                className={` invalid:border-red-500 ${addressLine2Err && 'border-red-500'}`}
              />
            </div>
            <div className="flex flex-row gap-5 pb-5">
              <div className="flex-1 flex flex-col ">
                <div className="flex flex-row justify-between items-center">
                  <label className=" mb-1 uppercase">city</label>
                  {cityErr && <p className="text-red-500 uppercase">{cityErr.message}</p>}
                </div>
                <input
                  type="text"
                  {...register('billing.address.city', registerOptions.city)}
                  className={` invalid:border-red-500 ${cityErr && 'border-red-500'}`}
                />
              </div>
              <div className="flex-1 flex flex-col ">
                <div className="flex flex-row justify-between items-center">
                  <label className=" mb-1 uppercase">state</label>
                  {stateErr && <p className="text-red-500 uppercase">{stateErr.message}</p>}
                </div>
                <input
                  {...register('billing.address.state', registerOptions.state)}
                  type="text"
                  className={` invalid:border-red-500 ${stateErr && 'border-red-500'}`}
                />
              </div>
            </div>
            <div className="flex flex-row gap-5 pb-5">
              <div className="flex-1 flex flex-col ">
                <div className="flex flex-row justify-between items-center">
                  <label className=" mb-1 uppercase">zip code</label>
                  {zipCodeErr && <p className="text-red-500 uppercase">{zipCodeErr.message}</p>}
                </div>
                <input
                  type="text"
                  {...register('billing.address.zipCode', registerOptions.zipCode)}
                  className={` invalid:border-red-500 ${zipCodeErr && 'border-red-500'}`}
                />
              </div>
              <div className=" flex-1 ">
                <div className="flex flex-row justify-between items-center">
                  <label className=" mb-1 uppercase">phone</label>
                  {phoneErr && <p className="text-red-500 uppercase">{phoneErr.message}</p>}
                </div>
                <div className=" flex flex-col -">
                  <div className=" ">
                    {/* PHONE COUNTRY DROPDOWN */}
                    <div className=" ">
                      <span
                        className=" "
                        style={{
                          height: '13px',
                          backgroundPosition: '-29px -323px'
                        }}></span>
                    </div>
                  </div>
                  <input
                    type="tel"
                    {...register('billing.address.phone', registerOptions.phone)}
                    autoComplete="tel"
                    className={` invalid:border-red-500 ${phoneErr && 'border-red-500'}`}
                  />
                </div>
              </div>
            </div>
          </div>
        ) : (
          <div className=" flex flex-col justify-center items-center p-4 border">
            <div className="flex flex-row gap-1">
              <p>{shipping.address.firstName}</p>
              <p>{shipping.address.lastName}</p>
            </div>
            <p>{shipping.address.addressLine1}</p>
            <p>{shipping.address.addressLine2}</p>
            <div className="flex flex-row gap-1 mb-2">
              <p>{shipping.address.city},</p>
              <p>{shipping.address.state}</p>
              <p>{shipping.address.zipCode}</p>
            </div>
            <p>{shipping.address.phone}</p>
          </div>
        )}
      </div>
      <div className="px-5 py-5">
        <div>
          <p className="pb-4 uppercase">Payment method</p>
          <div className="flex flex-row flex-wrap gap-1">
            {paymentOptions.map((option, index) => (
              <div
                key={index}
                className="relative w-[33.3%] mb-2">
                <label
                  htmlFor={option.name}
                  className="group cursor-pointer">
                  <div
                    className={`flex flex-col justify-center w-full h-full min-h-[60px] border border-gray-400 ${
                      billing && billing.payment && option.name === billing.payment.method
                        ? 'border-green-500 bg-gray-400'
                        : ''
                    }`}>
                    <p className="text-center">{option.name}</p>
                  </div>
                </label>
                <input
                  type="radio"
                  id={option.name}
                  name="paymentMethod"
                  value={option.name}
                  className="absolute top-0 w-full h-full opacity-0 cursor-pointer"
                  onClick={() =>
                    setCheckout((checkout) => ({
                      ...checkout,
                      errorMessage: '',
                      billing: {
                        ...billing,
                        payment: { ...billing.payment, method: option.name }
                      }
                    }))
                  }
                />
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  )
}

export default Billing
