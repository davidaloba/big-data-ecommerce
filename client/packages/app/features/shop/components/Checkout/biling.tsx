import { useContext, useEffect, useState } from 'react'
import { CheckoutContext } from '.'
import Address from '@globalComponents/__lib/address'
import AddressForm from '@globalComponents/__lib/address-form'

const Billing = ({ register, watch, paymentOptions, errors, setValue }) => {
  const [checkout, setCheckout] = useContext(CheckoutContext)
  const { shipping, billing } = checkout
  const [billingAdd, setBillingAdd] = useState(true)
  const [checked, setChecked] = useState(paymentOptions[0].name)

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
    setValue('billing.payment.method', checked)

    setCheckout((checkout) => ({
      ...checkout,
      errorMessage: '',
      billing: {
        ...billing,
        address: watch('billing.address'),
        payment: { ...billing.payment, method: watch('billing.payment.method') }
      }
    }))
  }, [watch('billing.address'), watch('billing.payment.method')])

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
            }}
          />
          <label className=" min-w-max uppercase">Same as shipping address</label>
        </div>
        {billingAdd ? (
          <AddressForm
            address="billing.address"
            errors={errors}
            register={register}
            registerOptions={registerOptions}
          />
        ) : (
          <Address address={shipping.address} />
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
                    className={`flex flex-col justify-center w-full h-full min-h-[60px] border border-gray-400 
                  ${option.name === checked && 'border-green-500 bg-gray-400'}
                    
                    `}>
                    <p className="text-center">{option.name}</p>
                  </div>
                </label>
                <input
                  type="radio"
                  id={option.name}
                  name="paymentMethod"
                  value={option.name}
                  className="absolute top-0 w-full h-full opacity-0 cursor-pointer"
                  onClick={() => {
                    setChecked(option.name)
                    setCheckout((checkout) => ({
                      ...checkout,
                      errorMessage: '',
                      billing: {
                        ...billing,
                        payment: { ...billing.payment, method: option.name }
                      }
                    }))
                  }}
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
