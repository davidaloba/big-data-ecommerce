import '@styles/global.css'
import { store } from '../global/store'
import { Provider } from 'react-redux'
import { useRouter } from 'next/router'

function MyApp({ Component, pageProps: { session, ...pageProps } }) {
  return (
    <Provider store={store}>
      {Component.auth ? <Component {...pageProps} /> : <Component {...pageProps} />}
      ``{' '}
    </Provider>
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
