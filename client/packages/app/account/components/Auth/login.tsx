'use client'
import { useState } from 'react'
import { useForm } from 'react-hook-form'
import { useRouter } from 'next/navigation'
import { useAppDispatch } from '@globalStore/index'
import { login, setAuthModal } from '@app/account/store/account.slice'

import Link from 'next/link'

const Login = () => {
  const {
    register,
    handleSubmit,
    formState: { errors }
  } = useForm()

  const [remainLoggedIn, setRemainLoggedIn] = useState(false)

  const emailErr = (errors && errors.email && errors.email) || null
  const passwordErr = (errors && errors.password && errors.password) || null

  const registerOptions = {
    email: {
      required: 'Email is required',
      pattern: {
        value: /^[A-Z0-9._%+-]+@[A-Z0-9.-]+.[A-Z]{2,4}$/i,
        message: 'Invalid email address'
      }
    },
    password: {
      required: 'Password is required',
      minLength: {
        value: 8,
        message: 'Email must have at least 8 characters'
      },
      validate: {
        uppercase: (value) =>
          /[A-Z]/g.test(value) || 'Password should contain at least one uppercase letter',
        lowercase: (value) =>
          /[a-z]/g.test(value) || 'Password should contain at least one lowercase letter',
        number: (value) => /[0-9]/g.test(value) || 'Password should contain at least one number',
        specialCharacter: (value) =>
          /[#?!@$%^&*-]/g.test(value) || 'Password should contain at least one special character'
      }
    },
    remainLoggedIn: {}
  }

  const dispatch = useAppDispatch()
  const router = useRouter()

  const onSubmit = (data) => {
    dispatch(login(data))
    dispatch(setAuthModal(false))
    router.push('/account/details')
  }

  return (
    <div>
      <form onSubmit={handleSubmit(onSubmit)}>
        <div className="pb-6 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1 ">Email</label>
            {emailErr && <p className="text-red-500  text-right">{emailErr.message}</p>}
          </div>
          <input
            {...register(`email`, registerOptions.email)}
            type="text"
            autoFocus
            className={` invalid:border-red-500 ${emailErr && 'border-red-500'}`}
          />
        </div>
        <div className="pb-6 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1 ">Password</label>
            {passwordErr && <p className="text-red-500  text-right">{passwordErr.message}</p>}
          </div>
          <input
            {...register(`password`, registerOptions.password)}
            type="password"
            autoFocus
            className={` invalid:border-red-500 ${emailErr && 'border-red-500'}`}
          />
        </div>
        <div className=" flex flex-row gap-5 pb-6">
          <div className="flex-1 flex flex-col ">
            <div className=" flex ">
              <div
                className={` h-[13px] w-[13px] ${
                  remainLoggedIn && 'bg-gray-600'
                } mr-2 border border-gray-200 `}>
                <input
                  {...register(`remainLoggedIn`, registerOptions.remainLoggedIn)}
                  type="checkbox"
                  checked={remainLoggedIn}
                  className="opacity-0 cursor-pointer"
                  onChange={() => setRemainLoggedIn(!remainLoggedIn)}
                />
              </div>
              <label className=" min-w-max uppercase">Keep Me Logged In</label>
            </div>
          </div>
          <div className="flex-1 flex flex-col">
            <Link
              className="underline text-right"
              href="/forgot-password">
              Forgot Password?
            </Link>
          </div>
        </div>
        <div className=" flex flex-row justify-between p-1 bg-gray-700 ">
          <button
            className="grow border-0 text-left text-white  hover:underline "
            type="submit">
            Login
          </button>
          <div className=" text-2xl  text-white">{`>`}</div>
        </div>
      </form>
    </div>
  )
}

export default Login
