import AccountMenu from '@app/account/components/Menu'

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <section className="pb-2 md:pb-5 pt-10 px-5 md:px-20 lg:px-36">
      <div className="flex flex-row items-stretch justify-between gap-12">
        <div className=" w-1/5">
          <AccountMenu />
        </div>
        <div className=" w-4/5">{children}</div>
      </div>
    </section>
  )
}
