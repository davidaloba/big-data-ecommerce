'use client'
import { useRouter } from 'next/navigation'
import { RootState, useAppSelector } from '@globalStore/index'

import AccountMenu from '@app/account/components/Menu'

export default function AccountLayout({ children }: { children: React.ReactNode }) {
  const router = useRouter()
  const { user } = useAppSelector((state: RootState) => state.auth)
  !user && router.push('/')

  return (
    <section className="pb-2 md:pb-5 pt-10 px-5 md:px-20 lg:px-36">
      <div className="flex flex-row items-stretch justify-between gap-12">
        <div className=" w-1/5 p-2  border border-gray-200">
          <AccountMenu />
        </div>
        <div className=" w-4/5 p-2  border border-gray-200">{children}</div>
      </div>
    </section>
  )
}
