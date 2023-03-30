import { ClientRouter, ClientRoute } from '@appUtils/approuter'
import NoResults from '@marketingComponents/__lib/no-results'

export default function Home() {
  return (
    <ClientRouter>
      <ClientRoute
        path="/"
        component={
          <NoResults
            status="error"
            length={0}
          />
        }
      />
    </ClientRouter>
  )
}
