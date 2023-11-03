'use client'
import { useState } from 'react'
import Login from './login'
import Register from './register'
import Link from 'next/link'
import { setAuthModal } from '@app/account/store/account.slice'
import { useAppDispatch } from '@globalStore/index'

const AuthModal = () => {
  const [newUser, setNewUser] = useState(false)
  const dispatch = useAppDispatch()

  return (
    <div className={`z-50 flex justify-center items-center fixed w-full h-full px-5 bg-black/50`}>
      <div
        className=" fixed w-full h-full px-5"
        onClick={() => dispatch(setAuthModal(false))}></div>
      <div className=" z-10 w-full max-w-[24rem] border p-5 border-gray-200 bg-white uppercase   ">
        {!newUser ? (
          <div>
            <div className="mb-4">Already have an account?</div>
            <Login />
            <div className="py-8">
              <div className="pb-2">Create an account </div>
              <div className="pb-2 normal-case text-[8px]">
                Save payment and shipping details, view order history, return items, and shop from
                custom wishlists.
              </div>
              <div
                onClick={() => setNewUser(true)}
                className=" flex flex-row justify-between items-center border border-gray-500 p-1  ">
                <div className="grow border-0 text-left  hover:underline ">Create an account</div>
                <div className=" text-2xl ">{`>`}</div>
              </div>
            </div>
          </div>
        ) : (
          <div>
            <div className="mb-4">Create an account.</div>
            <Register />
            <div className="py-8">
              <div className="pb-2">Already have an account </div>
              <div
                onClick={() => setNewUser(false)}
                className=" flex flex-row justify-between items-center border border-gray-500 p-1  ">
                <div className="grow border-0 text-left  hover:underline ">Sign in</div>
                <div className=" text-2xl ">{`>`}</div>
              </div>
            </div>
          </div>
        )}
        <div className="">
          <div className="pb-2">Don't have an account? </div>
          <div className="pb-2 normal-case text-[8px]">
            In a hurry? Continue without registering this time.
          </div>
          <Link
            onClick={() => dispatch(setAuthModal(false))}
            href="/checkout"
            className=" flex flex-row justify-between items-center border border-gray-500 p-1  ">
            <div className="grow border-0 text-left  hover:underline ">Checkout as guest</div>
            <div className=" text-2xl ">{`>`}</div>
          </Link>
        </div>
      </div>
    </div>
  )
}

export default AuthModal
