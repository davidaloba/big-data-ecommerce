import AccountLayout from '@app/account/components/Layout'

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return <AccountLayout children={children} />
}
