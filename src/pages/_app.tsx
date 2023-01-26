import '@styles/global.css'
import { SessionProvider, useSession } from 'next-auth/react'
import { store } from '../global/store'
import { Provider } from 'react-redux'
import { useRouter } from 'next/router'

function MyApp({ Component, pageProps: { session, ...pageProps } }) {
  return (
    <SessionProvider session={session}>
      <Provider store={store}>
        {Component.auth ? (
          <Auth adminOnly={Component.auth.adminOnly}>
            <Component {...pageProps} />
          </Auth>
        ) : (
          <Component {...pageProps} />
        )}
        ``{' '}
      </Provider>
    </SessionProvider>
  )
}

function Auth({ children, adminOnly }) {
  const router = useRouter()
  const { status, data: session } = useSession({
    required: true,
    onUnauthenticated() {
      router.push('/unauthorized?message=login required')
    }
  })
  if (status === 'loading') {
    return <div>Loading...</div>
  }
  if (adminOnly && !session.user.isAdmin) {
    router.push('/unauthorized?message=admin login required')
  }

  return children
}

export default MyApp
