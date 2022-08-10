import {Switch,Route,useLocation} from 'react-router-dom'
import {TransitionGroup,CSSTransition} from "react-transition-group";

//ui
import UiAlerts from '../components/ui/UiAlerts'
import UiBadges from '../components/ui/UiBadges'
import UiBreadcrumbs  from '../components/ui/UiBreadcrumbs'
import UiButtons from '../components/ui/UiButtons'
import UiCards from '../components/ui/UiCards'
import UiCarousels from '../components/ui/UiCarousels'
import UiColors from '../components/ui/UiColors'
import UiEmbed from '../components/ui/UiEmbed'
import UiGrids from '../components/ui/UiGrids'
import UiImages from '../components/ui/UiImages'
import UiListGroups from '../components/ui/UiListGroups'
import UiMediaObjects from '../components/ui/UiMediaObjects'
import UiModals from '../components/ui/UiModals'
import UiNotifications from '../components/ui/UiNotifications'
import UiPaginations from '../components/ui/UiPaginations'
import UiPopOvers from '../components/ui/UiPopOvers'
import UiProgressBars from  '../components/ui/UiProgressBars'
import UiTabs from '../components/ui/UiTabs'
import UiTooltips from '../components/ui/UiTooltips'
import UiTypography from '../components/ui/UiTypography'

//form-wizard
import SimpleWizard from '../components/form-wizard/simple-wizard';
import ValidateWizard from '../components/form-wizard/validate-wizard';
import VerticalWizard from '../components/form-wizard/vertical-wizard';

// icon-heroicon
import Heroicons from '../components/Icons/Heroicons ';
import Dripicons from '../components/Icons/dripicons';
import FontAwsome from '../components/Icons/fontawsome';
import LineAwsome from '../components/Icons/lineawsome';
import Remixicons from '../components/Icons/remixicons';
import Unicons from '../components/Icons/unicons'

//Form
import Checkbox from '../components/forms/checkbox'
import Elements from '../components/forms/elements'
import Radio from '../components/forms/radio'
import FromSwitch from '../components/forms/switch'
import Validations from '../components/forms/validations'

//Table
import BasicTable from '../components/table/basictable'
import DataTable from '../components/table/datatable'
import EditTable from '../components/table/edittable'

const ComponentRoute = () => {

    let location = useLocation();

    return (
        <TransitionGroup>
            <CSSTransition
            key={location.key}
            classNames="fade"
            timeout={300}
            >
                <Switch  location={location}>             
                    {/* Form  */}
                    <Route path="/form-chechbox"      component={Checkbox} />
                    <Route path="/form-layout"        component={Elements} />
                    <Route path="/form-radio"         component={Radio} />
                    <Route path="/form-switch"        component={FromSwitch} />
                    <Route path="/form-validation"    component={Validations} />

                    {/* Icon */}
                    <Route path="/icon-heroicon" component={Heroicons}/>
                    <Route path="/icon-dripicons" component={Dripicons}/>
                    <Route path="/icon-fontawesome-5" component={FontAwsome}/>
                    <Route path="/icon-lineawesome" component={LineAwsome}/>
                    <Route path="/icon-remixicon" component={Remixicons}/>
                    <Route path="/icon-unicons" component={Unicons}/>

                    {/* Table */}
                    <Route path="/tables-basic"    component={BasicTable} />
                    <Route path="/data-table"     component={DataTable} />
                    <Route path="/table-editable" component={EditTable} />

                    {/* Ui */}
                    <Route path="/ui-alerts"         component={UiAlerts}/>
                    <Route path="/ui-badges"         component={UiBadges}/>
                    <Route path="/ui-breadcrumb"     component={UiBreadcrumbs}/>
                    <Route path="/ui-buttons"        component={UiButtons}/>
                    <Route path="/ui-cards"          component={UiCards}/>
                    <Route path="/ui-carousel"       component={UiCarousels}/>
                    <Route path="/ui-colors"         component={UiColors}/>
                    <Route path="/ui-embed-video"    component={UiEmbed}/>
                    <Route path="/ui-grid"           component={UiGrids}/>
                    <Route path="/ui-images"         component={UiImages}/>
                    <Route path="/ui-list-group"     component={UiListGroups}/>
                    <Route path="/ui-media-object"   component={UiMediaObjects}/>
                    <Route path="/ui-modal"          component={UiModals}/>
                    <Route path="/ui-notifications"  component={UiNotifications}/>
                    <Route path="/ui-pagination"     component={UiPaginations}/>
                    <Route path="/ui-popovers"       component={UiPopOvers}/>
                    <Route path="/ui-progressbars"   component={UiProgressBars}/>
                    <Route path="/ui-tabs"           component={UiTabs}/>
                    <Route path="/ui-tooltips"       component={UiTooltips}/>
                    <Route path="/ui-typography"     component={UiTypography}/>
                    
                    {/* Form-wizard */}
                    <Route path="/form-wizard"      component={SimpleWizard}/>
                    <Route path="/form-wizard-validate"    component={ValidateWizard}/>
                    <Route path="/form-wizard-vertical"    component={VerticalWizard}/>

                </Switch>
            </CSSTransition>
        </TransitionGroup>
    )
}

export default ComponentRoute