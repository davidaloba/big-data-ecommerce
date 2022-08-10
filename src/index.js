import React, { useState } from "react";
import ReactDOM from 'react-dom';
import App from './ui/App';
import { BrowserRouter } from 'react-router-dom';
import reportWebVitals from './reportWebVitals';

import { Provider } from 'react-redux';

import { store } from './store'

export default function Index() {
    let arr = [true, true, true, true];
    const [alert, alertSet] = useState(arr);

    const setAlert = (id) => {
        let newArr = [...alert];
        newArr[id] = false;
        alertSet(newArr);
        setTimeout(() => {
            alertSet([true, true, true, true]);
        }, 1000);
    };

    return (
        <div className="overflow-x-hidden flex flex-col items-center justify-center py-36 px-4 gap-y-8 relative lg:mr-6">
            <div className="h-28 relative w-full flex items-center justify-end">
                {/* Success */}
                <div id="alertSucess" className={`${alert[0] ? "translate-show" : "translate-hide"} absolute max-w-2xl w-full bg-white border-l-4 border-green-600 rounded shadow transition duration-700 ease-in-out`}>
                    <div className="p-5 relative">
                        <div className="flex items-start">
                            <div className>
                                <svg className="mt-1" width={20} height={20} viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M10 0.25C4.62391 0.25 0.25 4.62391 0.25 10C0.25 15.3761 4.62391 19.75 10 19.75C15.3761 19.75 19.75 15.3761 19.75 10C19.75 4.62391 15.3761 0.25 10 0.25ZM15.0742 6.73234L8.77422 14.2323C8.70511 14.3147 8.61912 14.3812 8.52207 14.4273C8.42502 14.4735 8.31918 14.4983 8.21172 14.5H8.19906C8.09394 14.5 7.99 14.4778 7.89398 14.435C7.79797 14.3922 7.71202 14.3297 7.64172 14.2516L4.94172 11.2516C4.87315 11.1788 4.81981 11.0931 4.78483 10.9995C4.74986 10.9059 4.73395 10.8062 4.73805 10.7063C4.74215 10.6064 4.76617 10.5084 4.8087 10.4179C4.85124 10.3275 4.91142 10.2464 4.98572 10.1796C5.06002 10.1127 5.14694 10.0614 5.24136 10.0286C5.33579 9.99578 5.43581 9.98219 5.53556 9.98861C5.63531 9.99502 5.73277 10.0213 5.82222 10.0659C5.91166 10.1106 5.99128 10.1726 6.05641 10.2484L8.17938 12.6072L13.9258 5.76766C14.0547 5.61863 14.237 5.52631 14.4335 5.51066C14.6299 5.49501 14.8246 5.55728 14.9754 5.68402C15.1263 5.81075 15.2212 5.99176 15.2397 6.18793C15.2582 6.3841 15.1988 6.57966 15.0742 6.73234Z"
                                        fill="#10B981"
                                    />
                                </svg>
                            </div>
                            <div className="ml-6">
                                <h1 className="text-lg font-semibold leading-4 text-gray-800">Success</h1>
                                <p className="text-sm leading-5 font-normal mt-2 text-gray-600">Your files are successfully uploaded</p>
                                <div className="mt-3 flex items-center">
                                    <a href="javascript:void(0)" className="text-sm leading-3 foucs:underline font-medium pb-0.5 text-green-700 focus:outline-none border-b border-white hover:border-green-700  duration-100">
                                        View Details
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div id="close-modal" onClick={() => setAlert(0)} className="absolute right-0 top-0 m-6 z-40 cursor-pointer">
                            <svg width={20} height={20} viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M15 5L5 15" stroke="#6B7280" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                <path d="M5 5L15 15" stroke="#6B7280" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                            </svg>
                        </div>
                    </div>
                </div>
                {/* Success */}
            </div>
            <div className="relative h-28 w-full flex items-center justify-end">
                {/* Pending */}
                <div id="alertPending" className={`${alert[1] ? "translate-show" : "translate-hide"} absolute max-w-2xl w-full bg-white border-l-4 border-blue-600 rounded shadow transition duration-700 ease-in-out`}>
                    <div className="p-5 relative">
                        <div className="flex items-start">
                            <div>
                                <svg width={24} height={24} viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M12 2V6" stroke="#2563EB" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                    <path d="M12 18V22" stroke="#2563EB" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                    <path d="M4.92999 4.92993L7.75999 7.75993" stroke="#2563EB" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                    <path d="M16.24 16.24L19.07 19.07" stroke="#2563EB" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                    <path d="M2 12H6" stroke="#2563EB" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                    <path d="M18 12H22" stroke="#2563EB" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                    <path d="M4.92999 19.07L7.75999 16.24" stroke="#2563EB" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                    <path d="M16.24 7.75993L19.07 4.92993" stroke="#2563EB" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                </svg>
                            </div>
                            <div className="ml-6">
                                <h1 className="text-lg font-semibold leading-4 text-gray-800">Pending</h1>
                                <p className="text-sm leading-5 font-normal mt-2 text-gray-600">Your files are pending upload</p>
                                <div className="mt-3 flex items-center">
                                    <a href="javascript:void(0)">
                                        <p className="text-sm leading-3 font-medium pb-0.5 text-blue-700 focus:outline-none border-b border-white hover:border-blue-700 focus:underline duration-100">View Details</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div className="absolute right-0 top-0 m-6 z-40 cursor-pointer" onClick={() => setAlert(1)}>
                            <svg width={20} height={20} viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M15 5L5 15" stroke="#6B7280" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                <path d="M5 5L15 15" stroke="#6B7280" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                            </svg>
                        </div>
                    </div>
                </div>
                {/* Pending */}
            </div>
            <div className="mt-3 sm:mt-0 h-28 relative w-full flex items-center justify-end">
                {/* Warning */}
                <div id="alertWarning" className={`${alert[2] ? "translate-show" : "translate-hide"} absolute max-w-2xl w-full bg-white border-l-4 border-yellow-700 rounded shadow transition duration-700 ease-in-out`}>
                    <div className="p-5 relative">
                        <div className="flex items-start">
                            <div>
                                <svg width={20} height={18} viewBox="0 0 20 18" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path
                                        d="M19.0502 15.7069L11.0613 0.870937C10.4951 -0.180938 8.98662 -0.180938 8.4199 0.870937L0.431461 15.7069C0.308514 15.9352 0.246874 16.1916 0.252558 16.4508C0.258241 16.7101 0.331055 16.9635 0.46389 17.1863C0.596726 17.409 0.785045 17.5935 1.01047 17.7217C1.23589 17.85 1.49071 17.9176 1.75006 17.918H17.7293C17.9888 17.918 18.2439 17.8507 18.4697 17.7226C18.6954 17.5945 18.8841 17.4101 19.0172 17.1873C19.1503 16.9644 19.2233 16.7109 19.2291 16.4514C19.2349 16.1919 19.1733 15.9354 19.0502 15.7069ZM9.74084 15.6211C9.55542 15.6211 9.37416 15.5661 9.21999 15.4631C9.06582 15.3601 8.94566 15.2137 8.8747 15.0424C8.80374 14.8711 8.78518 14.6826 8.82135 14.5007C8.85752 14.3188 8.94681 14.1518 9.07792 14.0207C9.20904 13.8896 9.37608 13.8003 9.55794 13.7641C9.7398 13.7279 9.9283 13.7465 10.0996 13.8175C10.2709 13.8884 10.4173 14.0086 10.5203 14.1627C10.6234 14.3169 10.6783 14.4982 10.6783 14.6836C10.6783 14.8067 10.6541 14.9286 10.607 15.0424C10.5599 15.1561 10.4908 15.2595 10.4037 15.3465C10.3167 15.4336 10.2133 15.5026 10.0996 15.5497C9.98586 15.5968 9.86395 15.6211 9.74084 15.6211ZM10.759 6.19219L10.4899 11.9109C10.4899 12.1098 10.4109 12.3006 10.2702 12.4413C10.1296 12.5819 9.93881 12.6609 9.7399 12.6609C9.54099 12.6609 9.35022 12.5819 9.20957 12.4413C9.06892 12.3006 8.9899 12.1098 8.9899 11.9109L8.72084 6.19453C8.71479 6.05793 8.73631 5.92151 8.7841 5.79341C8.8319 5.6653 8.905 5.54813 8.99905 5.44888C9.0931 5.34963 9.20617 5.27033 9.33151 5.2157C9.45686 5.16108 9.59192 5.13225 9.72865 5.13094H9.73849C9.87615 5.13087 10.0124 5.15869 10.139 5.21272C10.2656 5.26675 10.38 5.34587 10.4752 5.44531C10.5704 5.54475 10.6444 5.66245 10.6929 5.7913C10.7413 5.92015 10.7632 6.05748 10.7571 6.195L10.759 6.19219Z"
                                        fill="#F59E0B"
                                    />
                                </svg>
                            </div>
                            <div className="ml-6">
                                <h1 className="text-lg font-semibold leading-4 text-gray-800">Warning</h1>
                                <p className="text-sm leading-5 font-normal mt-2 text-gray-600">This is a warning message about the upload of your files!</p>
                                <div className="mt-3 flex items-center">
                                    <a href="javascript:void(0)">
                                        <p className="text-sm leading-3 font-medium pb-0.5 text-yellow-600 focus:outline-none border-b border-white hover:border-yellow-600 focus:underline duration-100">View Details</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div className="absolute right-0 top-0 m-6 z-40 cursor-pointer" onClick={() => setAlert(2)}>
                            <svg width={20} height={20} viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M15 5L5 15" stroke="#6B7280" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                <path d="M5 5L15 15" stroke="#6B7280" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                            </svg>
                        </div>
                    </div>
                </div>
                {/* Warning */}
            </div>
            <div className="mt-3 sm:mt-0 h-28 relative w-full flex items-center justify-end">
                {/* Error */}
                <div id="alertError" className={`${alert[3] ? "translate-show" : "translate-hide"} absolute max-w-2xl w-full bg-white border-l-4 border-red-600 rounded shadow transition duration-700 ease-in-out`}>
                    <div className="p-5 relative">
                        <div className="flex items-start">
                            <div>
                                <svg width={20} height={20} viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10 0.25C4.62391 0.25 0.25 4.62391 0.25 10C0.25 15.3761 4.62391 19.75 10 19.75C15.3761 19.75 19.75 15.3761 19.75 10C19.75 4.62391 15.3761 0.25 10 0.25ZM14.0608 13L13 14.0608L10 11.0608L7 14.0608L5.93922 13L8.93922 10L5.93922 7L7 5.93922L10 8.93922L13 5.93922L14.0608 7L11.0608 10L14.0608 13Z" fill="#EF4444" />
                                </svg>
                            </div>
                            <div className="ml-6">
                                <h1 className="text-lg font-semibold leading-4 text-gray-800">Error</h1>
                                <p className="text-sm leading-5 font-normal mt-2 text-gray-600">Could not upload files!</p>
                                <div className="mt-3 flex items-center">
                                    <a href="javascript:void(0)">
                                        <p className="text-sm leading-3 font-medium pb-0.5 text-red-700 focus:outline-none border-b border-white hover:border-red-700 focus:underline duration-100">View Details</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div className="absolute right-0 top-0 m-6 z-40 cursor-pointer" onClick={() => setAlert(3)}>
                            <svg width={20} height={20} viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M15 5L5 15" stroke="#6B7280" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                                <path d="M5 5L15 15" stroke="#6B7280" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round" />
                            </svg>
                        </div>
                    </div>
                </div>
                {/* Error */}
            </div>

            <style>
                {`
                    .translate-show{
                        transform : translateX(0%);
                    }
                    .translate-hide{
                        transform : translateX(500%);
                    }
                `}
            </style>
        </div>
    );
}

ReactDOM.render(
  <React.Fragment>
        <BrowserRouter basename={process.env.PUBLIC_URL}>
        <Provider store={store}>
            <App />
        </Provider>
      </BrowserRouter>
  </React.Fragment>,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
