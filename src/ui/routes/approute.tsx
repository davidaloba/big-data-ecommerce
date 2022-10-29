import { Routes, Route, useLocation } from 'react-router-dom'

//main
import { Dashbord } from '../views/main/dashbord'
import { Rating } from '../views/main/rating'
import { Comment } from '../views/main/comment'
import { Pricing } from '../views/main/pricing'

//user
import { AddAdmin } from '../views/user/adduser'
import { AdminList } from '../views/user/userlist'

//App
import { UserProfile } from '../views/usermanagement/userprofile'
import { UserPrivacySetting } from '../views/usermanagement/userprivacysetting'
import { UserAccountSettingList } from '../views/usermanagement/useraccountsetting'
import { UserProfileEdit } from '../views/usermanagement/userprofileedit'

const AppRoute = () => {
  const location = useLocation()

  return (
    <div>
      <div key={location.key}>
        <Routes location={location}>
          <Route
            path="/"
            element={<Dashbord />}
          />
          <Route
            path="/rating"
            element={<Rating />}
          />
          <Route
            path="/comment"
            element={<Comment />}
          />
          <Route
            path="/pages-pricing"
            element={<Pricing />}
          />

          {/* User */}
          <Route
            path="/add-admin"
            element={<AddAdmin />}
          />
          <Route
            path="/admin-list"
            element={<AdminList />}
          />

          {/* App */}
          <Route
            path="/user-profile"
            element={<UserProfile />}
          />
          <Route
            path="/user-privacy-setting"
            element={<UserPrivacySetting />}
          />
          <Route
            path="/user-account-setting"
            element={<UserAccountSettingList />}
          />
          <Route
            path="/user-profile-edit"
            element={<UserProfileEdit />}
          />
        </Routes>
      </div>
    </div>
  )
}

export default AppRoute
