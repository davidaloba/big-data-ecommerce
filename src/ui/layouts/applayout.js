import React, { useState, useEffect } from 'react';
import { useDispatch, useSelector } from "react-redux";
import { useHistory } from "react-router-dom";

import HeaderStyle from '../partials/headerstyle/headerstyle';
import SidebarStyle from '../partials/sidebarstyle/sidebarstyle'
import FooterStyle from '../partials/footerstyle/footerstyle'

import AppRoute from '../routes/approute'

const AppLayout = () => {
    const { userInfo } = useSelector((state) => state.user)
    const dispatch = useDispatch()
    const router = useHistory()

    const [isLoading, setIsLoading] = useState(true)

    useEffect(() => {
        if (!userInfo) {
            router.push('/sign-in')
        }
        setIsLoading(false)
      console.log(userInfo);
    }, [router, userInfo])
    

    return(
        <>
            {!isLoading && <div className="wrapper">
                <SidebarStyle />
                <HeaderStyle />
                <div className="content-page" id="content-page">
                    <AppRoute />
                </div>
            </div>}
            <FooterStyle />
        </>
    )
}


export default AppLayout;