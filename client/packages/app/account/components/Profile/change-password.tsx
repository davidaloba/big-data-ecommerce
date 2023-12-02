import { useForm } from 'react-hook-form'
import { useChangePasswordMutation } from '@app/account/store/auth.api'
import PassForm from './password-form'

const ChangePassword = ({ setEdit, setConfirmation }) => {
  const {
    register,
    handleSubmit,
    watch,
    formState: { errors }
  } = useForm({
    mode: 'onBlur'
  })
  const registerOptions = {
    currentPassword: { required: 'Enter your current password' },
    password: {
      pattern: {
        required: 'Enter your new password',
        value: /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/,
        message:
          'Password must have at least 1 number, 1 uppercase and lowercase letter, and be more than 8 characters'
      }
    },
    passwordConfirmation: {
      validate: {
        confirmPassword: (value) => watch('password') === value || "Passwords don't match"
      }
    }
  }

  const [changePassword, { error, isSuccess }] = useChangePasswordMutation()

  if (isSuccess) {
    setEdit('')
    setConfirmation('Password changed successfully')
    setTimeout(() => setConfirmation(''), 5000)
  }

  const onSubmit = async (data, e) => await changePassword(data)

  return (
    <form
      className="p-3 "
      onSubmit={handleSubmit(onSubmit)}>
      <PassForm
        setEdit={setEdit}
        form="password"
        errors={errors}
        submitError={error?.data?.error?.message}
        register={register}
        registerOptions={registerOptions}
      />
    </form>
  )
}

export default ChangePassword
