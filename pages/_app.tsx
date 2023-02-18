import App from 'next/app'
import ErrorPage from 'next/error'
import { wrapper } from '@store/index'
import 'tailwindcss/tailwind.css'
import { getLocalizedParams } from '@utils/localize'
import { getGlobal, getRunningQueriesThunk, useGetGlobalQuery } from '@store/api'

MyApp.getInitialProps = wrapper.getInitialAppProps((store) => async (appContext) => {
  const appProps = await App.getInitialProps(appContext)
  const { locale } = getLocalizedParams(appContext.ctx.query)
  try {
    store.dispatch(getGlobal.initiate(locale))
    await Promise.all(store.dispatch(getRunningQueriesThunk()))

    return { ...appProps, locale, pageProps: {} }
  } catch (error) {
    return { ...appProps }
  }
})

function MyApp({ Component, pageProps, locale }) {
  const { data: global, error, isSuccess: globalIsSuccess } = useGetGlobalQuery(locale)

  if (error || !global.attributes) {
    return <ErrorPage statusCode={404} />
  }
  return (
    <>
      {globalIsSuccess && (
        <Component
          {...pageProps}
          global={global}
        />
      )}
    </>
  )
}

export default wrapper.withRedux(MyApp)
