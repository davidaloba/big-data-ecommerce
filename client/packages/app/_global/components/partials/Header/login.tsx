'use client'
import Login from '@accountComponents/Auth/login'
import Register from '@accountComponents/Auth/register'

const AccountPage = () => {
  return (
    <section className="pb-10 md:pb-20 pt-0 px-5 md:px-12 lg:px-16 2xl:px-20">
      <div className="relative flex flex-col md:flex-row justify-center items-stretch uppercase">
        <div className="w-full max-w-xl mt-16 mr-[2%] border border-gray-200 p-5 ">
          <div className="mb-10">Returning Customer</div>
          <Login />
        </div>
        <div className="w-full max-w-xl mt-16 ml-[2%] border border-gray-200 p-5">
          <div className="mb-10">New Customer</div>
          <Register />
        </div>
      </div>
    </section>
  )
}

export default AccountPage
