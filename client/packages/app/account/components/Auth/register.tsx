'use client'
import Link from 'next/link'
import { useState } from 'react'
import { useForm } from 'react-hook-form'

const Login = () => {
  const {
    register,
    handleSubmit,
    watch,
    formState: { errors }
  } = useForm()

  const [newsletter, setNewsletter] = useState(false)
  const [gender, setGender] = useState('')

  const registerOptions = {
    firstName: { required: 'Name is required' },
    gender: { required: 'Gender is required' },
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
    confirmPassword: {
      required: 'password confirmation is required',
      validate: {
        confirmPassword: (value) => watch('password') === value || "Passwords don't match"
      }
    },
    newsletter: {}
  }

  const firstNameErr = (errors && errors.firstName && errors.firstName) || null
  const genderErr = (errors && errors.gender && errors.gender) || null
  const emailErr = (errors && errors.email && errors.email) || null
  const passwordErr = (errors && errors.password && errors.password) || null
  const confirmPasswordErr = (errors && errors.confirmPassword && errors.confirmPassword) || null

  const onSubmit = (data) => {
    console.log(data)
  }

  return (
    <div>
      <form onSubmit={handleSubmit(onSubmit)}>
        <div className="pb-6 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1 ">Name</label>
            {firstNameErr && <p className="text-red-500  text-right">{firstNameErr.message}</p>}
          </div>
          <input
            {...register(`firstName`, registerOptions.firstName)}
            type="text"
            autoFocus
            className={` invalid:border-red-500 ${firstNameErr && 'border-red-500'}`}
          />
        </div>
        <div className="flex flex-row justify-between items-center pb-6">
          <div className="flex flex-row  ">
            <div className="mr-4">Gender</div>
            <div className={` flex flex-row`}>
              <div className=" flex mr-4 ">
                <div
                  className={` h-[13px] w-[13px] 
                    ${gender === 'male' && 'bg-gray-600'} mr-2 border border-gray-200 `}>
                  <input
                    {...register(`gender`, registerOptions.gender)}
                    type="checkbox"
                    checked={gender === 'male' ? true : false}
                    value={gender}
                    className="opacity-0 cursor-pointer"
                    onChange={() => {
                      setGender('male')
                    }}
                  />
                </div>
                <label className=" min-w-max uppercase">male</label>
              </div>
              <div className=" flex ">
                <div
                  className={` h-[13px] w-[13px] 
                    ${gender === 'female' && 'bg-gray-600'} mr-2 border border-gray-200 `}>
                  <input
                    {...register(`gender`, registerOptions.gender)}
                    type="checkbox"
                    checked={gender === 'female' ? true : false}
                    value={gender}
                    className="opacity-0 cursor-pointer"
                    onChange={() => {
                      setGender('female')
                    }}
                  />
                </div>
                <label className=" min-w-max uppercase">female</label>
              </div>
            </div>
          </div>
          {genderErr && <p className="text-red-500  text-right ">{genderErr.message}</p>}
        </div>
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
        <div className="pb-6 flex flex-col ">
          <div className="flex flex-row justify-between items-center">
            <label className=" mb-1 ">Password Confirmation</label>
            {confirmPasswordErr && (
              <p className="text-red-500  text-right">{confirmPasswordErr.message}</p>
            )}
          </div>
          <input
            {...register(`confirmPassword`, registerOptions.confirmPassword)}
            type="password"
            autoFocus
            className={` invalid:border-red-500 ${emailErr && 'border-red-500'}`}
          />
        </div>
        <div className="py-4 text-[8px]">
          BY REGISTERING YOUR DETAILS, YOU AGREE TO OUR TERMS AND CONDITIONS AND PRIVACY AND COOKIE
          POLICY.
        </div>

        <div className=" flex flex-col  pb-6">
          <div className=" flex ">
            <div
              className={` h-[13px] w-[13px] ${
                newsletter && 'bg-gray-600'
              } mr-2 border border-gray-200 `}>
              <input
                {...register(`newsletter`, registerOptions.newsletter)}
                type="checkbox"
                checked={newsletter}
                className="opacity-0 cursor-pointer"
                onChange={() => setNewsletter(!newsletter)}
              />
            </div>
            <label className=" min-w-max uppercase">Subscribe to newsletter</label>
          </div>
        </div>
        <div className=" flex flex-row justify-between p-1 bg-gray-700 ">
          <button
            className="grow border-0 text-left text-white  hover:underline "
            type="submit">
            Register
          </button>
          <div className=" text-2xl  text-white">{`>`}</div>
        </div>
      </form>
    </div>
  )
}

export default Login
