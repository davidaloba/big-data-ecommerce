import App from 'next/app'
import ErrorPage from 'next/error'
// Store
import { QueryClient, QueryClientProvider } from 'react-query' // replace with:
const queryClient = new QueryClient()
import { Provider } from 'react-redux'
import { store } from '@store/index'
// Styles
import 'tailwindcss/tailwind.css'
// Utils
import { getStrapiURL } from '@utils/index' // for fetching data from server
import { getLocalizedParams } from '@utils/localize' // for fetching site language from url query

MyApp.getInitialProps = async (appContext) => {
  // Get default App props
  const appProps = await App.getInitialProps(appContext)
  // Get global data attributes from server(strapi)
  const { locale } = getLocalizedParams(appContext.ctx.query)
  try {
    const res = await fetch(
      getStrapiURL(
        `/global?populate[navigation][populate]=*&populate[footer][populate][footerColumns][populate]=*&locale=${locale}`
      )
    )
    const globalData = await res.json()
    const globalDataAttributes = globalData.data.attributes
    // Add global data attributes to appProps as pageProps
    return { ...appProps, pageProps: { global: globalDataAttributes } }
  } catch (error) {
    return { ...appProps }
  }
}

function MyApp({ Component, pageProps }) {
  const { global } = pageProps
  if (global === null) {
    return <ErrorPage statusCode={404} />
  }

  return (
    <>
      <Provider store={store}>
        <QueryClientProvider client={queryClient}>
          <Component {...pageProps} />
        </QueryClientProvider>
      </Provider>
    </>
  )
}

export default MyApp
