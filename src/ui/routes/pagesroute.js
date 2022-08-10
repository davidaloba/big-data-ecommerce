import {Switch,Route} from 'react-router-dom'


//auth pages
import ConfirmMail from '../pages/auth/confirmmail'
import LockScreen from '../pages/auth/lockscreen'
import RecoverPassword from '../pages/auth/recoverpassword'
import SignIn from '../pages/auth/signin'
import SignUp from '../pages/auth/signup'

//ExtarPages
import Maintainance from '../pages/maintainance'
import Error404 from '../pages/error404'
import Error500 from '../pages/error500'
import CommingSoon from '../pages/commingsoon'
import Timeline1 from '../pages/timeline1'
import Invoice from '../pages/invoice'
import Invoiceview from '../pages/invoiceview';
import FAQ from '../pages/faq'
import BlankPage from '../pages/blankpage'
import TermsOfUse from '../pages/termsOfUse'
import PrivacyPolicy from '../pages/privacyPolicy'

const PagesRoute = props => {
    return (
        <Switch>
            {/* auth */}
            <Route path="/confirm-mail" component={ConfirmMail} />
            <Route path="/lock-screen" component={LockScreen} />
            <Route path="/recoverpw" component={RecoverPassword} />
            <Route path="/sign-in" component={SignIn} />
            <Route path="/sign-up" component={SignUp} />

            {/* ExtraPages */}
            <Route path="error" component={Error404} />
            <Route path="error-500" component={Error500} />
            <Route path="comingsoon" component={CommingSoon} />
            <Route path="maintenance" component={Maintainance} />
            <Route path="/pages-timeline" component={Timeline1} />
            <Route path="/pages-invoice" component={Invoice} />
            <Route path="/pages-faq" component={FAQ} />
            <Route path="/blank-page" component={BlankPage} />
            <Route path="/terms-of-service" component={TermsOfUse} />
            <Route path="/privacy-policy" component={PrivacyPolicy} />
            <Route path="/invoice-view" component={Invoiceview} />

        </Switch>
    )
}

export default PagesRoute