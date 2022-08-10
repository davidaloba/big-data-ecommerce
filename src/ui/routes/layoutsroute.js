import {Switch,Route} from 'react-router-dom'
import AppLayout from '../layouts/applayout'
import PageLayout from '../layouts/pagelayout';

const LayoutsRoute = props => {
    return (
        <Switch>

            {/* auth */}
            <Route path="/confirm-mail" component={PageLayout} />
            <Route path="/lock-screen" component={PageLayout} />
            <Route path="/recoverpw" component={PageLayout} />
            <Route path="/sign-in" component={PageLayout} />
            <Route path="/sign-up" component={PageLayout} />

            {/* pages */}
            <Route path="/error" component={PageLayout} />
            <Route path="/error-500" component={PageLayout} />
            <Route path="/comingsoon" component={PageLayout} />
            <Route path="/maintenance" component={PageLayout} />
            <Route path="/pages-timeline" component={PageLayout} />
            <Route path="/pages-invoice" component={PageLayout} />
            <Route path="/pages-faq" component={PageLayout} />
            <Route path="/blank-page" component={PageLayout} />
            <Route path="/terms-of-service" component={PageLayout} />
            <Route path="/privacy-policy" component={PageLayout} />
            <Route path="/invoice-view" component={PageLayout} />


            <Route path="/" component={AppLayout} />
        </Switch>
    )
}

export default LayoutsRoute