import { Routes, Route, useLocation } from 'react-router-dom'

//ui
import { UiAlerts } from './ui/UiAlerts'
import { UiBadges } from './ui/UiBadges'
import { UiBreadcrumbs } from './ui/UiBreadcrumbs'
import { UiButtons } from './ui/UiButtons'
import { UiCards } from './ui/UiCards'
import { UiCarousels } from './ui/UiCarousels'
import { UiColors } from './ui/UiColors'
import { UiEmbed } from './ui/UiEmbed'
import { UiGrids } from './ui/UiGrids'
import { UiImages } from './ui/UiImages'
import { UiListGroups } from './ui/UiListGroups'
import { UiMediaObjects } from './ui/UiMediaObjects'
import { UiModals } from './ui/UiModals'
import { UiNotifications } from './ui/UiNotifications'
import { UiPaginations } from './ui/UiPaginations'
import { UiPopOvers } from './ui/UiPopOvers'
import { UiProgressBars } from './ui/UiProgressBars'
import { UiTabs } from './ui/UiTabs'
import { UiTooltips } from './ui/UiTooltips'
import { UiTypography } from './ui/UiTypography'

//form-wizard
import { SimpleWizard } from './form-wizard/simple-wizard'
import { ValidateWizard } from './form-wizard/validate-wizard'
import { VerticalWizard } from './form-wizard/vertical-wizard'

// icon-heroicon
import { Heroicons } from './Icons/Heroicons '
import { Dripicons } from './Icons/dripicons'
import { FontAwsome } from './Icons/fontawsome'
import { LineAwsome } from './Icons/lineawsome'
import { Remixicons } from './Icons/remixicons'
import { Unicons } from './Icons/unicons'

//Form
import { Checkbox } from './forms/checkbox'
import { Elements } from './forms/elements'
import { Radio } from './forms/radio'
import { FromSwitch } from './forms/switch'
import { Validations } from './forms/validations'

//Table
import { BasicTable } from './table/basictable'
import { DataTable } from './table/datatable'
import { EditTable } from './table/edittable'

const ComponentRoute = () => {
  const location = useLocation()

  return (
    <div>
      <div key={location.key}>
        <Routes location={location}>
          {/* Form  */}
          <Route
            path="/form-chechbox"
            element={<Checkbox />}
          />
          <Route
            path="/form-layout"
            element={<Elements />}
          />
          <Route
            path="/form-radio"
            element={<Radio />}
          />
          <Route
            path="/form-switch"
            element={<FromSwitch />}
          />
          <Route
            path="/form-validation"
            element={<Validations />}
          />

          {/* Icon */}
          <Route
            path="/icon-heroicon"
            element={<Heroicons />}
          />
          <Route
            path="/icon-dripicons"
            element={<Dripicons />}
          />
          <Route
            path="/icon-fontawesome-5"
            element={<FontAwsome />}
          />
          <Route
            path="/icon-lineawesome"
            element={<LineAwsome />}
          />
          <Route
            path="/icon-remixicon"
            element={<Remixicons />}
          />
          <Route
            path="/icon-unicons"
            element={<Unicons />}
          />

          {/* Table */}
          <Route
            path="/tables-basic"
            element={<BasicTable />}
          />
          <Route
            path="/data-table"
            element={<DataTable />}
          />
          <Route
            path="/table-editable"
            element={<EditTable />}
          />

          {/* Ui */}
          <Route
            path="/ui-alerts"
            element={<UiAlerts />}
          />
          <Route
            path="/ui-badges"
            element={<UiBadges />}
          />
          <Route
            path="/ui-breadcrumb"
            element={<UiBreadcrumbs />}
          />
          <Route
            path="/ui-buttons"
            element={<UiButtons />}
          />
          <Route
            path="/ui-cards"
            element={<UiCards />}
          />
          <Route
            path="/ui-carousel"
            element={<UiCarousels />}
          />
          <Route
            path="/ui-colors"
            element={<UiColors />}
          />
          <Route
            path="/ui-embed-video"
            element={<UiEmbed />}
          />
          <Route
            path="/ui-grid"
            element={<UiGrids />}
          />
          <Route
            path="/ui-images"
            element={<UiImages />}
          />
          <Route
            path="/ui-list-group"
            element={<UiListGroups />}
          />
          <Route
            path="/ui-media-object"
            element={<UiMediaObjects />}
          />
          <Route
            path="/ui-modal"
            element={<UiModals />}
          />
          <Route
            path="/ui-notifications"
            element={<UiNotifications />}
          />
          <Route
            path="/ui-pagination"
            element={<UiPaginations />}
          />
          <Route
            path="/ui-popovers"
            element={<UiPopOvers />}
          />
          <Route
            path="/ui-progressbars"
            element={<UiProgressBars />}
          />
          <Route
            path="/ui-tabs"
            element={<UiTabs />}
          />
          <Route
            path="/ui-tooltips"
            element={<UiTooltips />}
          />
          <Route
            path="/ui-typography"
            element={<UiTypography />}
          />

          {/* Form-wizard */}
          <Route
            path="/form-wizard"
            element={<SimpleWizard />}
          />
          <Route
            path="/form-wizard-validate"
            element={<ValidateWizard />}
          />
          <Route
            path="/form-wizard-vertical"
            element={<VerticalWizard />}
          />
        </Routes>
      </div>
    </div>
  )
}

export default ComponentRoute
