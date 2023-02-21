import App, { AppProps } from 'next/app'
import ErrorPage from 'next/error'
import { wrapper } from '@store/index'
import 'tailwindcss/tailwind.css'
import { getLocalizedParams } from '@utils/localize'
import { getGlobal, getRunningQueriesThunk, useGetGlobalQuery } from '@store/api'
// @ts-expect-error TS(6137): Cannot import type declaration files. Consider imp... Remove this comment to see the full error message
import type { Global } from '@types/models'

const MyApp = ({ Component, pageProps }: AppProps) => {
  const { data: global, error, isSuccess: globalIsSuccess } = useGetGlobalQuery(pageProps.locale)
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
  const { locale } = getLocalizedParams(appContext.ctx.query)
  const localeT = locale as string
  try {
    store.dispatch(getGlobal.initiate(localeT))
    await Promise.all(store.dispatch(getRunningQueriesThunk()))
    return { ...appProps, pageProps: { locale } }
  } catch (error) {
    return { ...appProps }
  }
})

export default wrapper.withRedux(MyApp)
