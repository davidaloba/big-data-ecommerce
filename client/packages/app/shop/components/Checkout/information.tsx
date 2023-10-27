import AddressForm from '@app/_global/components/__lib/address-form'

const Information = ({ register, errors }) => {
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

  return (
    <div className=" px-5 py-5 ">
      <p className=" pb-5 uppercase ">select address</p>
      <AddressForm
        address="shipping.address"
        errors={errors}
        register={register}
        registerOptions={registerOptions}
      />
      <div className=" "></div>
    </div>
  )
}

export default Information
