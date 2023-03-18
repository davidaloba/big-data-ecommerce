import AppLayout from '@marketingComponents/layouts/applayout'
import { ClientRouterProvider, ClientRouter, ClientRoute } from '/packages/app/approuter'

export default function Home() {
  return (
    <ClientRouterProvider>
      <AppLayout>
        <ClientRouter whileLoading={<Loading />}>
          <ClientRoute
            path="summary"
            component={<Summary />}
          />
          <ClientRoute
            path="transactions"
            component={<Transactions />}
          />
        </ClientRouter>
      </AppLayout>
    </ClientRouterProvider>
  )
}
