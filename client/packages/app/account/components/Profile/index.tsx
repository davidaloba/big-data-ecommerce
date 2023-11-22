'use client'
import { RootState, useAppSelector } from '@globalStore/index'
import { useRouter } from 'next/navigation'

export default function Profile() {
  const { user } = useAppSelector((state: RootState) => state.auth)

  return (
    <div className="min-w-max flex flex-col p-3 uppercase">
      <div className="pb-4">Personal Info</div>
      <ul className="text-gray-400">
        <li className="flex flex-row pb-4">
          <div className="w-1/4  text-gray-400">First Name:</div>
          <div className="text-gray-400">{`${user.firstName || '-----'}`}</div>
        </li>
        <li className="flex flex-row pb-4">
          <div className="w-1/4 text-gray-400">Last Name:</div>
          <div className="text-gray-400">{`${user.lastName || '-----'}`}</div>
        </li>
        <li className="flex flex-row pb-4">
          <div className="w-1/4 text-gray-400">Email Address:</div>
          <div className="text-gray-400">{`${user.email || '-----'}`}</div>
        </li>
        <li className="flex flex-row pb-4">
          <div className="w-1/4 text-gray-400">Phone Number:</div>
          <div className="text-gray-400">{`${user.phone || '-----'}`}</div>
        </li>
        <li className="flex flex-row pb-4">
          <div className="w-1/4 text-gray-400">Date of Birth:</div>
          <div className="text-gray-400">{`${user.dob || '-----'}`}</div>
        </li>
        <li className="flex flex-row pb-4">
          <div className="w-1/4 text-gray-400">Gender:</div>
          <div className="text-gray-400">{`${user.gender || '-----'}`}</div>
        </li>
        <li className="flex flex-row pb-4">
          <div className="w-1/4 text-gray-400">Password:</div>
          <div className="text-gray-400">**********</div>
        </li>
      </ul>
      <div className="mt-6 pb-4 underline ">Edit</div>
    </div>
  )
}
