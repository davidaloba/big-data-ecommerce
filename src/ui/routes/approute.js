import {Switch,Route,useLocation} from 'react-router-dom'
import {TransitionGroup,CSSTransition} from "react-transition-group";


//main
import Dashbord from '../views/main/dashbord'
import Rating from '../views/main/rating';
import Comment from '../views/main/comment';
import Pricing from '../views/main/pricing';

//user
import AddAdmin from '../views/user/adduser';
import AdminList from '../views/user/userlist';

//App
import UserProfile from '../views/usermanagement/userprofile'
import UserPrivacySetting from '../views/usermanagement/userprivacysetting'
import UserAccountSettingList from '../views/usermanagement/useraccountsetting'
import UserProfileEdit from '../views/usermanagement/userprofileedit'

//Category
import AddCategory from '../views/category/add-category';
import CategoryList from '../views/category/category-list';

//Movie
import AddMessage from '../views/message/add-message';
import MessageList from '../views/message/message-list';

//Show
import AddShow from '../views/show/add-show';
import ShowList from '../views/show/show-list';

const AppRoute = () => {

    let location = useLocation();

    return (
        <TransitionGroup>
            <CSSTransition
            key={location.key}
            classNames="fade"
            timeout={300}
            >
                <Switch  location={location}>
                    <Route path="/" exact component={MessageList} />
                    <Route path="/rating" exact component={Rating} />
                    <Route path="/comment" exact component={Comment} />
                    <Route path="/pages-pricing" exact component={Pricing} />
                    
                    {/* User */}
                    <Route path="/add-admin"       component={AddAdmin}/>
                    <Route path="/admin-list" exact component={AdminList} />

                    {/* App */}
                    <Route path="/user-profile"         component={UserProfile} />
                    <Route path="/user-privacy-setting" component={UserPrivacySetting} />
                    <Route path="/user-account-setting" component={UserAccountSettingList} />
                    <Route path="/user-profile-edit"    component={UserProfileEdit} />

                    {/* Category */}
                    <Route path="/add-category"       component={AddCategory}/>
                    <Route path="/category-list"      component={CategoryList}/>
                    
                    {/* Movie */}
                    <Route path="/add-message"        component={AddMessage}/>
                    <Route path="/message-list" component={MessageList}/>

                    {/* Show */}
                    <Route path="/add-show"        component={AddShow}/>
                    <Route path="/show-list"       component={ShowList}/>

                </Switch>
            </CSSTransition>
        </TransitionGroup>
    )
}

export default AppRoute