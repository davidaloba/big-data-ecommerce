import AppLayout from '@components/app/layout'
import {
  ClientRouterProvider,
  ClientRouter,
  ClientRoute
} from '@components/app/router'

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
