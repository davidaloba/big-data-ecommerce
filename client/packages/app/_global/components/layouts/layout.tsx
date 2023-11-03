'use client'
import { RootState, useAppSelector } from '@globalStore/index'

import PreviewBanner from '@globalComponents/partials/PreviewBanner'
import Header from '@globalComponents/partials/Header'
import Main from '@globalComponents/partials/Main'
import Footer from '@globalComponents/partials/Footer'
import AuthModal from '@app/account/components/Auth/modal'

export default function Layout({ preview, header, children, footer }) {
  const { authModal } = useAppSelector((state: RootState) => state.account)
  return (
    <>
      {authModal && <AuthModal />}
      {preview && <PreviewBanner />}
      {header && <Header {...header} />}
      {children && <Main>{children}</Main>}
      {footer && <Footer {...footer} />}
    </>
  )
}
