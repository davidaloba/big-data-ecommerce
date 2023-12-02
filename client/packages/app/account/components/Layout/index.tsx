'use client'
import { useRouter } from 'next/navigation'
import { RootState, useAppSelector } from '@globalStore/index'

import AccountMenu from '@accountComponents/Menu'

export default function AccountLayout({ children }: { children: React.ReactNode }) {
  const router = useRouter()
  const { userToken } = useAppSelector((state: RootState) => state.account)
  !userToken && router.push('/')

  return (
    <section className="pb-2 md:pb-5 pt-10 px-5 md:px-20 lg:px-36">
      <div className="flex flex-col md:flex-row items-stretch justify-between gap-12">
        <div className=" w-full md:w-1/5 ">
          <div className="sticky top-20">
            <AccountMenu />
          </div>
        </div>
        <div className=" w-full md:w-4/5 ">{children}</div>
      </div>
    </section>
  )
}
