const AddressForm = ({ address, errors, registerOptions, register }) => {
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

  return (
    <div className="uppercase">
      <div className=" flex flex-row gap-5 pb-5">
        <div className="flex-1 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1  ">First Name</label>
            {firstNameErr && <p className="text-red-500  ">{firstNameErr.message}</p>}
          </div>
          <input
            {...register(`${address}.firstName`, registerOptions.firstName)}
            type="text"
            autoFocus
            className={` invalid:border-red-500 ${firstNameErr && 'border-red-500'}`}
          />
        </div>
        <div className="flex-1 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1  ">Last Name</label>
            {lastNameErr && <p className="text-red-500  ">{lastNameErr.message}</p>}
          </div>
          <input
            type="text"
            {...register(`${address}.lastName`, registerOptions.lastName)}
            className={` invalid:border-red-500 ${lastNameErr && 'border-red-500'}`}
          />
        </div>
      </div>
      <div className="pb-5 flex flex-col ">
        <div className="flex flex-row justify-between items-center">
          <label className=" mb-1  ">E-mail</label>
          {emailErr && <p className="text-red-500  ">{emailErr.message}</p>}
        </div>
        <input
          type="email"
          {...register(`${address}.email`, registerOptions.email)}
          className={` invalid:border-red-500 ${emailErr && 'border-red-500'}`}
        />
      </div>
      <div className="pb-5 flex flex-col ">
        <div className="flex flex-row justify-between items-center">
          <label
            aria-live="assertive"
            role="alert"
            className="mb-1   ">
            Country/Region
          </label>
          {countryErr && <p className="text-red-500  ">{countryErr.message}</p>}
        </div>
        <input
          type="dropdown"
          {...register(`${address}.country`, registerOptions.country)}
          className={` invalid:border-red-500 ${countryErr && 'border-red-500'}`}>
          {/* ADDRESS DROPDOWN */}
        </input>
      </div>
      <div className="  pb-5 flex flex-col ">
        <div className="flex flex-row justify-between items-center">
          <label className=" mb-1  ">street line</label>
          {addressLine1Err && <p className="text-red-500  ">{addressLine1Err.message}</p>}
        </div>
        <input
          type="text"
          {...register(`${address}.addressLine1`, registerOptions.addressLine1)}
          className={` invalid:border-red-500 ${addressLine1Err && 'border-red-500'}`}
        />
      </div>
      <div className="pb-5 flex flex-col ">
        <div className="flex flex-row justify-between items-center">
          <label className=" mb-1  ">street line 2</label>
          {addressLine2Err && <p className="text-red-500  ">{addressLine2Err.message}</p>}
        </div>
        <input
          {...register(`${address}.addressLine2`, registerOptions.addressLine2)}
          type="text"
          className={` invalid:border-red-500 ${addressLine2Err && 'border-red-500'}`}
        />
      </div>
      <div className="flex flex-row gap-5 pb-5">
        <div className="flex-1 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1  ">city</label>
            {cityErr && <p className="text-red-500  ">{cityErr.message}</p>}
          </div>
          <input
            type="text"
            {...register(`${address}.city`, registerOptions.city)}
            className={` invalid:border-red-500 ${cityErr && 'border-red-500'}`}
          />
        </div>
        <div className="flex-1 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1  ">state</label>
            {stateErr && <p className="text-red-500  ">{stateErr.message}</p>}
          </div>
          <input
            {...register(`${address}.state`, registerOptions.state)}
            type="text"
            className={` invalid:border-red-500 ${stateErr && 'border-red-500'}`}
          />
        </div>
      </div>
      <div className="flex flex-row gap-5 pb-5">
        <div className="flex-1 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1  ">zip code</label>
            {zipCodeErr && <p className="text-red-500  ">{zipCodeErr.message}</p>}
          </div>
          <input
            type="text"
            {...register(`${address}.zipCode`, registerOptions.zipCode)}
            className={` invalid:border-red-500 ${zipCodeErr && 'border-red-500'}`}
          />
        </div>
        <div className=" flex-1 ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1  ">phone</label>
            {phoneErr && <p className="text-red-500  ">{phoneErr.message}</p>}
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
              {...register(`${address}.phone`, registerOptions.phone)}
              autoComplete="tel"
              className={` invalid:border-red-500 ${phoneErr && 'border-red-500'}`}
            />
          </div>
        </div>
      </div>
    </div>
  )
}

export default AddressForm
