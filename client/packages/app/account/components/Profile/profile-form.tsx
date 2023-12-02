const AddressForm = ({ setEdit, form, errors, submitError, registerOptions, register }) => {
  const firstNameErr = (errors && errors.firstName && errors.firstName) || null
  const lastNameErr = (errors && errors.lastName && errors.lastName) || null
  const emailErr = (errors && errors.email && errors.email) || null
  const confirmEmailErr = (errors && errors.email && errors.email) || null
  const phoneErr = (errors && errors.phone && errors.phone) || null
  const genderErr = (errors && errors.gender && errors.gender) || null
  const dobErr = (errors && errors.dob && errors.dob) || null

  return (
    <div className="uppercase">
      <p className=" pb-5 uppercase ">Personal Info</p>
      {submitError && <p className="text-red-500  py-5 uppercase ">{submitError}</p>}
      <div className=" flex flex-row gap-5 pb-2 ">
        <div className="flex-1 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1  text-gray-500">First Name</label>
            {firstNameErr && <p className="text-red-500  ">{firstNameErr.message}</p>}
          </div>
          <input
            {...register(`firstName`, registerOptions.firstName)}
            type="text"
            autoFocus
            className={` invalid:border-red-500 ${firstNameErr && 'border-red-500'}`}
          />
        </div>
        <div className="flex-1 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1  text-gray-500">Last Name</label>
            {lastNameErr && <p className="text-red-500  ">{lastNameErr.message}</p>}
          </div>
          <input
            type="text"
            {...register(`lastName`, registerOptions.lastName)}
            className={` invalid:border-red-500 ${lastNameErr && 'border-red-500'}`}
          />
        </div>
      </div>
      <div className="pb-2  flex flex-col ">
        <div className="flex flex-row justify-between items-center">
          <label className=" mb-1  text-gray-500">E-mail</label>
          {emailErr && <p className="text-red-500  ">{emailErr.message}</p>}
        </div>
        <input
          type="email"
          {...register(`email`, registerOptions.email)}
          className={` invalid:border-red-500 ${emailErr && 'border-red-500'}`}
        />
      </div>
      <div className="pb-2  flex flex-col ">
        <div className="flex flex-row justify-between items-center">
          <label className=" mb-1  text-gray-500">Confirm E-mail</label>
          {confirmEmailErr && <p className="text-red-500  ">{confirmEmailErr.message}</p>}
        </div>
        <input
          type="email"
          {...register(`confirmEmail`, registerOptions.confirmEmail)}
          className={` invalid:border-red-500 ${confirmEmailErr && 'border-red-500'}`}
        />
      </div>
      <div className="flex flex-row gap-5 pb-2">
        <div className=" flex-1 ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1  text-gray-500">phone</label>
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
              {...register(`phone`, registerOptions.phone)}
              autoComplete="tel"
              className={` invalid:border-red-500 ${phoneErr && 'border-red-500'}`}
            />
          </div>
        </div>
        <div className="flex-1 flex flex-col justify-end pb-2 text-gray-500">
          IF WE NEED TO CONTACT YOU ABOUT YOUR ORDER
        </div>
      </div>
      <div className="flex flex-row gap-5 pb-2">
        <div className="flex-1 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1  text-gray-500">Date of Birth</label>
            {dobErr && <p className="text-red-500  ">{dobErr.message}</p>}
          </div>
          <input
            type="date"
            {...register(`dob`, registerOptions.dob)}
            className={` invalid:border-red-500 ${dobErr && 'border-red-500'}`}
          />
        </div>
        <div className="flex-1 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1  text-gray-500">Gender</label>
            {genderErr && <p className="text-red-500  ">{genderErr.message}</p>}
          </div>
          <div className={` flex flex-row grow items-center justify-stretch `}>
            <select
              {...register(`gender`)}
              className={` invalid:border-red-500 ${genderErr && 'border-red-500'}`}
              defaultValue={null}>
              <option
                disabled
                hidden
                value="">
                -- select an option --
              </option>
              <option value="male">male</option>
              <option value="female">female</option>
            </select>
          </div>
        </div>
      </div>

      <div className="flex flex-row gap-5 pb-2">
        <div className=" flex-1 flex flex-row justify-between items-center px-5 py-1 border ">
          <div
            onClick={() => setEdit('')}
            className="grow hover:underline   ">
            Cancel
          </div>
        </div>
        <button
          type="submit"
          className=" flex-1 flex flex-row justify-between items-center px-5 py-1   bg-gray-700 ">
          <div className="grow hover:underline  text-white ">Save Details</div>
          <div className=" text-2xl  text-white">{`>`}</div>
        </button>
      </div>
    </div>
  )
}

export default AddressForm
