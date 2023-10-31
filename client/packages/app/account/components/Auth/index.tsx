'use client'
import Login from './login'
import Register from './register'

const AccountPage = () => {
  return (
    <div className="flex justify-center">
      <div className="flex space-x-4">
        <Login />
        <Register />
      </div>
    </div>
  )
}

export default AccountPage
