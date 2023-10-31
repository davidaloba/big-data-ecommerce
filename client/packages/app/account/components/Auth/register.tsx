import { useForm } from 'react-hook-form'

const Register = () => {
  const {
    register,
    handleSubmit,
    formState: { errors }
  } = useForm()

  const onSubmit = (data) => {
    // Handle register logic here
  }

  return (
    <div>
      <h2>Register</h2>
      <form onSubmit={handleSubmit(onSubmit)}>
        <div>
          <label>Name</label>
          <input
            type="name"
            {...register('name', { required: true })}
          />
          {errors.name && <span>Name is required</span>}
        </div>
        <div>
          <label>Gender</label>
          <div>
            <label>
              <input
                type="radio"
                value="male"
                {...register('gender')}
              />
              Male
            </label>
            <label>
              <input
                type="radio"
                value="female"
                {...register('gender')}
              />
              Female
            </label>
          </div>
          {errors.gender && <span>Please select your gender</span>}
        </div>
        <div>
          <label>Email</label>
          <input
            type="email"
            {...register('email', { required: true })}
          />
          {errors.email && <span>Email is required</span>}
        </div>
        <div>
          <label>Password</label>
          <input
            type="password"
            {...register('password', { required: true })}
          />
          {errors.password && <span>Password is required</span>}
        </div>
        <div>
          <label>Confirm Password</label>
          <input
            type="password"
            {...register('confirmPassword', { required: true })}
          />
          {errors.confirmPassword && <span>Confirm Password is required</span>}
        </div>
        <button type="submit">Register</button>
      </form>
    </div>
  )
}

export default Register
