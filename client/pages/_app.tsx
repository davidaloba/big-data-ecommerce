import App, { AppProps } from 'next/app'
import { wrapper } from '@siteStore/index'
import 'tailwindcss/tailwind.css'
import '@siteStyles/global.css'

const MyApp = ({ Component, pageProps }: AppProps) => {
  return <Component {...pageProps} />
}

MyApp.getInitialProps = wrapper.getInitialAppProps(() => async (appContext) => {
  const appProps = await App.getInitialProps(appContext)
  return { ...appProps }
})

export default wrapper.withRedux(MyApp)
