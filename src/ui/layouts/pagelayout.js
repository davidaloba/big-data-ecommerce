import React from 'react'
import PagesRoute from '../routes/pagesroute'
import ComponentRoute from '../routes/componentsroute'



const PageLayout =() => {
    
    return(
        <>
        <div className="wrapper">
            <PagesRoute />
            <ComponentRoute />
       </div>
       </>
    )
}

export default PageLayout;

