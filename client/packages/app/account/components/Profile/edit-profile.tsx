import { useForm } from 'react-hook-form'
import ProfileForm from './profile-form'
import { useGetUserQuery, useUpdateUserMutation } from '@app/account/store/auth.api'

const EditProfile = ({ user, setEdit, setConfirmation }) => {
  const {
    register,
    handleSubmit,
    watch,
    setValue,
    formState: { errors }
  } = useForm({
    mode: 'onChange',
    defaultValues: {
      email: user.email,
      confirmEmail: user.email,
      firstName: user.firstName,
      lastName: user.lastName,
      phone: user.phone,
      gender: user.gender,
      dob: user.dob
    }
  })
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
    confirmEmailErr: {
      required: 'Email confirmation is required',
      validate: {
        confirmEmail: (value) => watch('profile.email') === value || "Emails don't match"
      }
    },
    phone: {
      minLength: {
        value: 1,
        message: 'Phone must have at least 1 character'
      },
      maxLength: {
        value: 50,
        message: 'Phone must have no more than 45 characters'
      }
    },
    gender: { required: 'Gender is required' },

    dob: {}
  }

  const [updateUser, { data, error, isSuccess }] = useUpdateUserMutation()

  if (data) {
    setEdit('')
    setConfirmation('Profile updated successfully')
    setTimeout(() => setConfirmation(''), 5000)
  }

  const onSubmit = async (data, e) => {
    const userInfo = {
      email: data.email,
      firstName: data.firstName,
      lastName: data.lastName,
      phone: data.phone,
      gender: data.gender,
      dob: data.dob
    }
    await updateUser(userInfo)
  }

  return (
    <form
      className="p-3 "
      onSubmit={handleSubmit(onSubmit)}>
      <ProfileForm
        setEdit={setEdit}
        form="profile"
        errors={errors}
        submitError={error?.data?.error?.message}
        register={register}
        registerOptions={registerOptions}
      />
    </form>
  )
}

export default EditProfile
