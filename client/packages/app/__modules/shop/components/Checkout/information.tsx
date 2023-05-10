const InformationDetails = ({ register }) => {
  const registerOptions = {
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
    zipcode: {
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

  return (
    <div className=" px-5 py-5 ">
      <div className=" ">
        <p className=" pb-5 uppercase ">select address</p>
        <div className=" ">
          <div className=" ">
            <div className=" ">
              <div>
                <div className=" flex flex-row gap-5 pb-5">
                  <div className=" flex-1">
                    <div className=" flex flex-col ">
                      <label className=" mb-1 uppercase">First Name</label>
                      <input
                        type="text"
                        {...register('info.firstName', registerOptions.firstName)}
                        aria-label="firstName"
                        aria-invalid="false"
                        className=" "
                      />
                    </div>
                  </div>
                  <div className=" flex-1 ">
                    <div className="flex flex-col ">
                      <label className=" mb-1 uppercase">Last Name</label>
                      <input
                        type="text"
                        {...register('info.lastName', registerOptions.lastName)}
                        aria-label="lastName"
                        aria-invalid="false"
                        className=" "
                      />
                    </div>
                  </div>
                </div>
                <div className=" pb-5">
                  <div className=" ">
                    <div className="flex flex-col ">
                      <label className=" mb-1 uppercase">E-mail</label>
                      <input
                        type="email"
                        {...register('info.email', registerOptions.email)}
                        aria-label="email"
                        aria-invalid="false"
                        className=" "
                      />
                    </div>
                  </div>
                </div>
                <div className=" pb-5">
                  <div className=" ">
                    <div className="flex flex-col ">
                      <label
                        aria-live="assertive"
                        role="alert"
                        htmlFor="addressForm-country-dropdownWithError"
                        className=" ">
                        Country/Region
                      </label>
                      <input
                        type="dropdown"
                        {...register('info.country', registerOptions.country)}
                        aria-label="country"
                        className=" ">
                        {/* ADDRESS DROPDOWN */}
                      </input>
                    </div>
                  </div>
                </div>
                <div className=" pb-5">
                  <div className=" ">
                    <div className="flex flex-col ">
                      <label className=" mb-1 uppercase">street line</label>
                      <input
                        type="text"
                        {...register('info.addressLine1', registerOptions.addressLine1)}
                        aria-label="addressLine1"
                        aria-invalid="false"
                        className=" "
                      />
                    </div>
                  </div>
                </div>
                <div className=" pb-5">
                  <div className=" ">
                    <div className="flex flex-col ">
                      <label className=" mb-1 uppercase">street line 2</label>
                      <input
                        {...register('info.addressLine2', registerOptions.addressLine2)}
                        aria-label="addressLine2"
                        aria-invalid="false"
                        type="text"
                        minLength={0}
                        maxLength={500}
                        className=" "
                      />
                    </div>
                  </div>
                </div>
                <div className="flex flex-row gap-5 pb-5">
                  <div className=" flex-1">
                    <div className="flex flex-col ">
                      <label className=" mb-1 uppercase">city</label>
                      <input
                        type="text"
                        {...register('info.city', registerOptions.city)}
                        aria-label="city"
                        aria-invalid="false"
                        className=" "
                      />
                    </div>
                  </div>
                  <div className="flex-1 ">
                    <div className="flex flex-col ">
                      <label className=" mb-1 uppercase">state</label>
                      <input
                        {...register('info.state', registerOptions.state)}
                        aria-label="state"
                        aria-invalid="false"
                        type="text"
                        className=" "
                      />
                    </div>
                  </div>
                </div>
                <div className="flex flex-row gap-5 pb-5">
                  <div className=" flex-1">
                    <div className="flex flex-col ">
                      <label className=" mb-1 uppercase">zip code</label>
                      <input
                        type="text"
                        {...register('info.zipCode', registerOptions.zipcode)}
                        aria-label="zipCode"
                        aria-invalid="false"
                        className=" "
                      />
                    </div>
                  </div>
                  <div className=" flex-1 ">
                    <div className=" ">
                      <label className=" mb-1 uppercase">phone</label>
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
                          {...register('info.phone', registerOptions.phone)}
                          aria-label="phone"
                          autoComplete="tel"
                          className=" "
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div className=" "></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}

export default InformationDetails
