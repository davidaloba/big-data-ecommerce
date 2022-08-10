import React, { useState, useEffect, useRef } from 'react' 
import { Container,Col,Row,Button, Form } from 'react-bootstrap'
import { Link ,useHistory} from 'react-router-dom'
import { useDispatch, useSelector } from "react-redux";
import axios from 'axios'
import Cookies from 'js-cookie'
import { login } from '../../../store/action'

const SignIn = (props) => {
   const { userInfo } = useSelector((state) => state.user)
   const dispatch = useDispatch()
   const router = useHistory()

   useEffect(() => {
      if (userInfo) {
         router.push('/')
      }
   })

   const [email, setEmail] = useState('')
   const [password, setPassword] = useState('')
   console.log(email,password);

   // const loginForm = useRef()
   const loginHandler = async () => {
      console.log('hey! log me in');
      // const form = loginForm.current
      // if (!form.checkValidity()) {
      //    return
      // }
      try {
         const { data } = await axios.post('/api/admin/login', {
            email: email,
            password: password
         })
         dispatch(login(data))
         Cookies.set('userInfo', data)
         router.push('/')
      } catch (err) {
         console.log(err.response)
         alert(err.response.data.message)
      }
   }


    return (
        <>
            <section className="sign-in-page">
               <Container>
                  <Row className="justify-content-center align-items-center height-self-center">
                     <Col lg="5" md="12"  className="align-self-center">
                        <div className="sign-user_card ">                    
                           <div className="sign-in-page-data">
                              <div className="sign-in-from w-100 m-auto">
                                 <h3 className="mb-3 text-center">Sign in</h3>
                                 <Form className="mt-4" action="">
                                    <Form.Group>                                 
                                       <Form.Control 
                                       type="email" 
                                       className="mb-0" 
                                       id="exampleInputEmail1" 
                                       placeholder="Enter email" 
                                        autoComplete="off"
                                        value={email}
                                        onChange={(e) => setEmail(e.target.value)}
                                       required/>
                                    </Form.Group>
                                    <Form.Group>                                 
                                       <Form.Control 
                                       type="password" 
                                       className="mb-0" 
                                       id="exampleInputPassword2" 
                                        placeholder="Password"
                                        value={password}
                                        onChange={(e) => setPassword(e.target.value)}
                                       required/>
                                    </Form.Group>
                                       <div className="sign-info">
                                          <Button type="button" onClick={loginHandler} variant="btn btn-primary">Sign in</Button>
                                          <div className="custom-control custom-checkbox d-inline-block">
                                             <input type="checkbox" className="custom-control-input" id="customCheck"/>
                                             <label className="custom-control-label" htmlFor="customCheck">Remember Me</label>
                                          </div>                                
                                       </div>                                    
                                 </Form>
                              </div>
                           </div>
                           <div className="mt-3">
                              <div className="d-flex justify-content-center links">
                                 Don't have an account? <Link to="/auth/sign-up" className="text-primary ml-2">Sign Up</Link>
                              </div>
                              <div className="d-flex justify-content-center links">
                                 <Link to="/auth/pages-recoverpw" className="f-link">Forgot your password?</Link>
                              </div>
                           </div>
                        </div>
                     </Col>
                  </Row>
               </Container>
            </section>
        </>
    )
}

export default SignIn