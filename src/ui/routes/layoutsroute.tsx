import { Routes, Route } from 'react-router-dom'
import AppLayout from '../layouts/applayout'
import PageLayout from '../layouts/pagelayout'

const LayoutsRoute = () => {
  return (
    <Routes>
      <Route
        path="/"
        element={<AppLayout />}
      />

      {/* auth */}
      <Route
        path="/confirm-mail"
        element={<PageLayout />}
      />
      <Route
        path="/lock-screen"
        element={<PageLayout />}
      />
      <Route
        path="/recoverpw"
        element={<PageLayout />}
      />
      <Route
        path="/sign-in"
        element={<PageLayout />}
      />
      <Route
        path="/sign-up"
        element={<PageLayout />}
      />

      {/* pages */}
      <Route
        path="/error"
        element={<PageLayout />}
      />
      <Route
        path="/error-500"
        element={<PageLayout />}
      />
      <Route
        path="/comingsoon"
        element={<PageLayout />}
      />
      <Route
        path="/maintenance"
        element={<PageLayout />}
      />
      <Route
        path="/pages-timeline"
        element={<PageLayout />}
      />
      <Route
        path="/pages-invoice"
        element={<PageLayout />}
      />
      <Route
        path="/pages-faq"
        element={<PageLayout />}
      />
      <Route
        path="/blank-page"
        element={<PageLayout />}
      />
      <Route
        path="/terms-of-service"
        element={<PageLayout />}
      />
      <Route
        path="/privacy-policy"
        element={<PageLayout />}
      />
      <Route
        path="/invoice-view"
        element={<PageLayout />}
      />
    </Routes>
  )
}

export default LayoutsRoute
