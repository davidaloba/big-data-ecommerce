import { Routes, Route } from 'react-router-dom'

//auth pages
import { ConfirmMail } from '../pages/auth/confirmmail'
import { LockScreen } from '../pages/auth/lockscreen'
import { RecoverPassword } from '../pages/auth/recoverpassword'
import { SignIn } from '../pages/auth/signin'
import { SignUp } from '../pages/auth/signup'

//ExtarPages
import { Maintainance } from '../pages/maintainance'
import { Error404 } from '../pages/error404'
import { Error500 } from '../pages/error500'
import { CommingSoon } from '../pages/commingsoon'
import { FAQ } from '../pages/faq'
import { BlankPage } from '../pages/blankpage'
import { TermsOfUse } from '../pages/termsOfUse'
import { PrivacyPolicy } from '../pages/privacyPolicy'

const PagesRoute = () => {
  return (
    <Routes>
      {/* auth */}
      <Route
        path="/confirm-mail"
        element={<ConfirmMail />}
      />
      <Route
        path="/lock-screen"
        element={<LockScreen />}
      />
      <Route
        path="/recoverpw"
        element={<RecoverPassword />}
      />
      <Route
        path="/sign-in"
        element={<SignIn />}
      />
      <Route
        path="/sign-up"
        element={<SignUp />}
      />

      {/* ExtraPages */}
      <Route
        path="error"
        element={<Error404 />}
      />
      <Route
        path="error-500"
        element={<Error500 />}
      />
      <Route
        path="comingsoon"
        element={<CommingSoon />}
      />
      <Route
        path="maintenance"
        element={<Maintainance />}
      />
      <Route
        path="/pages-faq"
        element={<FAQ />}
      />
      <Route
        path="/blank-page"
        element={<BlankPage />}
      />
      <Route
        path="/terms-of-service"
        element={<TermsOfUse />}
      />
      <Route
        path="/privacy-policy"
        element={<PrivacyPolicy />}
      />
    </Routes>
  )
}

export default PagesRoute
