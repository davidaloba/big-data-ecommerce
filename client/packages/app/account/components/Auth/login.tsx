import { useForm } from 'react-hook-form'

const Login = () => {
  const {
    register,
    handleSubmit,
    formState: { errors }
  } = useForm()

  const onSubmit = (data) => {
    // Handle login logic here
  }

  return (
    <div>
      <h2>Login</h2>
      <form onSubmit={handleSubmit(onSubmit)}>
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
        <button type="submit">Login</button>
      </form>
    </div>
  )
}

export default Login
