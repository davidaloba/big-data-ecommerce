import AppLayout from '@components/layouts/applayout'
import { ClientRouterProvider, ClientRouter, ClientRoute } from '@utils/approuter'

export default function Home() {
  return (
    <ClientRouterProvider>
      <AppLayout>
        // @ts-expect-error TS(2304): Cannot find name 'Loading'.
        <ClientRouter whileLoading={<Loading />}>
          <ClientRoute
            path="summary"
            // @ts-expect-error TS(2304): Cannot find name 'Summary'.
            component={<Summary />}
          />
          <ClientRoute
            path="transactions"
            // @ts-expect-error TS(2552): Cannot find name 'Transactions'. Did you mean 'IDB... Remove this comment to see the full error message
            component={<Transactions />}
          />
        </ClientRouter>
      </AppLayout>
    </ClientRouterProvider>
  )
}
