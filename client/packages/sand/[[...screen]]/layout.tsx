import ClientLayout from '@appComponents/layouts/layout.web'

export default async function Home({ children, params, ...rest }) {
  return (
    <ClientLayout
      params={params}
      preview={false}
      {...rest}>
      {children}
    </ClientLayout>
  )
}
