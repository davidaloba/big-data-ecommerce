import App, { AppProps } from 'next/app'
import { wrapper } from '@marketingStore/index'
import 'tailwindcss/tailwind.css'
import '@marketingStyles/global.css'

const MyApp = ({ Component, pageProps }: AppProps) => {
  return <Component {...pageProps} />
}

MyApp.getInitialProps = wrapper.getInitialAppProps(() => async (appContext) => {
  const appProps = await App.getInitialProps(appContext)
  return { ...appProps }
})

export default wrapper.withRedux(MyApp)
