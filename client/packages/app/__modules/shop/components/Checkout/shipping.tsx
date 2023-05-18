import { useContext } from 'react'
import { CheckoutContext } from '.'

const Information = ({ register, watch, shippingOptions }) => {
  const [checkout, setCheckout] = useContext(CheckoutContext)

  const registerOptions = {
    shipping: {
      required: 'Shipping method is required'
    }
  }

  return (
    <div className="px-5 py-5">
      <div>
        <p className="pb-4 uppercase">Shipping method</p>
        <div className="flex flex-row flex-wrap gap-1">
          {shippingOptions.map((option, index) => (
            <div
              key={index}
              className="relative w-[33.3%] mb-2">
              <label
                htmlFor={option.name}
                className="group cursor-pointer">
                <div
                  className={`flex flex-col justify-center w-full h-full min-h-[60px] border border-gray-400 ${
                    watch('shipping') && option.name === JSON.parse(watch('shipping')).name
                      ? 'border-green-500 bg-gray-400'
                      : ''
                  }`}>
                  <p className="text-center">
                    {option.name} <span>${option.price.toFixed(2)}</span>
                  </p>
                  <p className="text-center">({option.duration})</p>
                </div>
              </label>
              <input
                type="radio"
                {...register('shipping', registerOptions.shipping)}
                id={option.name}
                name="shipping"
                value={JSON.stringify(option)}
                className="absolute top-0 w-full h-full opacity-0 cursor-pointer"
              />
            </div>
          ))}
        </div>
      </div>
    </div>
  )
}

export default Information
