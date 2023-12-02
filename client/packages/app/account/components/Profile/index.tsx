'use client'
import { RootState, useAppSelector } from '@globalStore/index'
import { useState } from 'react'
import EditProfile from './edit-profile'
import ChangePassword from './change-password'
import { useGetUserQuery } from '@app/account/store/auth.api'

export default function Profile() {
  const { data: user } = useGetUserQuery('user')
  const [edit, setEdit] = useState('')
  const [confirmation, setConfirmation] = useState('')

  if (edit === '')
    return (
      <div className="p-2  border border-gray-200">
        <div className="min-w-max flex flex-col p-3 uppercase">
          <div className="flex flex-row justify-between">
            <div className="pb-4">Personal Info</div>
            {confirmation && <div className="pb-4">{confirmation}</div>}
          </div>
          <ul className="text-gray-400">
            <li className="flex flex-row pb-4">
              <div className="w-1/4  text-gray-400">First Name:</div>
              <div className="text-gray-400">{`${(user && user.firstName) || '-----'}`}</div>
            </li>
            <li className="flex flex-row pb-4">
              <div className="w-1/4 text-gray-400">Last Name:</div>
              <div className="text-gray-400">{`${(user && user.lastName) || '-----'}`}</div>
            </li>
            <li className="flex flex-row pb-4">
              <div className="w-1/4 text-gray-400">Email Address:</div>
              <div className="text-gray-400">{`${(user && user.email) || '-----'}`}</div>
            </li>
            <li className="flex flex-row pb-4">
              <div className="w-1/4 text-gray-400">Phone Number:</div>
              <div className="text-gray-400">{`${(user && user.phone) || '-----'}`}</div>
            </li>
            <li className="flex flex-row pb-4">
              <div className="w-1/4 text-gray-400">Date of Birth:</div>
              <div className="text-gray-400">{`${(user && user.dob) || '-----'}`}</div>
            </li>
            <li className="flex flex-row pb-4">
              <div className="w-1/4 text-gray-400">Gender:</div>
              <div className="text-gray-400">{`${(user && user.gender) || '-----'}`}</div>
            </li>
            <li className="flex flex-row pb-4">
              <div className="w-1/4 text-gray-400">Password:</div>
              <div className="text-gray-400">**********</div>
              <div
                className="underline ml-2 lowercase "
                onClick={() => setEdit('password')}>
                Change Password
              </div>
            </li>
          </ul>
          <div
            className="mt-6 pb-4 underline "
            onClick={() => setEdit('profile')}>
            Edit Profile
          </div>
        </div>
      </div>
    )
  if (edit === 'profile')
    return (
      <div className="p-2  border border-gray-200">
        <EditProfile
          setEdit={setEdit}
          setConfirmation={setConfirmation}
          user={user}
        />
      </div>
    )
  if (edit === 'password')
    return (
      <div className="p-2  border border-gray-200">
        <ChangePassword
          setEdit={setEdit}
          setConfirmation={setConfirmation}
        />
      </div>
    )
}
