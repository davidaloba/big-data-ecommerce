import App, { AppProps } from 'next/app'
import ErrorPage from 'next/error'
import { wrapper } from '@store/index'
import 'tailwindcss/tailwind.css'
import { getGlobal, getRunningQueriesThunk, useGetGlobalQuery } from '@store/api'
import { Global } from '@__types/models'

const MyApp = ({ Component, pageProps }: AppProps) => {
  const { data: global, error, isSuccess: globalIsSuccess } = useGetGlobalQuery()
  const globalData = global as Global

  if (error || !globalData.attributes) {
    return <ErrorPage statusCode={404} />
  }
  return (
    <div>
      {globalIsSuccess && (
        <Component
          {...pageProps}
          global={global}
        />
      )}
    </div>
  )
}

MyApp.getInitialProps = wrapper.getInitialAppProps((store) => async (appContext) => {
  const appProps = await App.getInitialProps(appContext)
  try {
    store.dispatch(getGlobal.initiate())
    await Promise.all(store.dispatch(getRunningQueriesThunk()))
    return { ...appProps }
  } catch (error) {
    return { ...appProps }
  }
})

export default wrapper.withRedux(MyApp)
