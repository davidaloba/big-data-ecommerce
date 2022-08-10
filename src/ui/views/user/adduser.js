import React, { useState, useEffect } from 'react'
import {Container,Row,Col,Form,Button} from 'react-bootstrap'
import Card from '../../components/Card'
import {  useSelector } from "react-redux";
import { useHistory } from 'react-router-dom'
import axios from 'axios'

const AddAdmin = () => { 
    let router =useHistory()
    const { userInfo } = useSelector((state) => state.user)

    // const dispatch = useDispatch()

    const [userName, setUserName] = useState('')
    const [email, setEmail] = useState('')
    const [password, setPassword] = useState('')
    const [confirmPassword, setConfirmPassword] = useState('')
    const [isSuperAdmin, setIsSuperAdmin] = useState(false)


    useEffect(() => {
        if (!userInfo.isSuperAdmin) {
            router.push('/')
        }

    }, [router, userInfo])

    const registerHandler = async () => {
    
        if (password !== confirmPassword) {
            alert('Your password entries do not match')
            return
        }
        try {
            const { data } = await axios.post('/api/admin/register', {
                name: userName,
                email,
                password,
                isSuperAdmin
            })
            alert(data.message)
            setUserName('')
            setEmail('')
            setPassword('')
            setConfirmPassword('')
            router.push('/user-list')
        } catch (err) {
            alert(err.response.data.message)
        }
    }

    return (
       <> 
            <Container fluid>
                <Row>
                    <Col sm="12">
                        <Card>
                            <Card.Header className="d-flex justify-content-between">
                                <Card.Header.Title>
                                    <h4 className="card-title">Add Admin</h4>
                                </Card.Header.Title>
                            </Card.Header>
                            <Card.Body>
                                <Row>
                                    <Col lg="12">
                              <Form className="" action="/">
                                 <Row>
                                    <Col md="6">
                                       <Form.Group>
                                          <Form.Label>Username</Form.Label>
                                                        <Form.Control type="text" className="mb-0" id="exampleInputEmail2" placeholder="Must contain letters and numbers only and no spaces" autoComplete="off" pattern='/^[a-zA-Z0-9]*$/'
                                                            value={userName}
                                                            onChange={(e) => setUserName(e.target.value)} required/>
                                       </Form.Group>
                                    </Col>
                                    <Col md="6">
                                       <Form.Group>  
                                          <Form.Label>E-mail</Form.Label>                               
                                                        <Form.Control type="email" className="mb-0" id="exampleInputEmail3" placeholder="Enter email" autoComplete="off"
                                                            pattern="/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/"
                                                            value={email}
                                                            onChange={(e) => setEmail(e.target.value)}  required/>
                                       </Form.Group>
                                    </Col>
                                    <Col md="6">
                                       <Form.Group>   
                                          <Form.Label>Password</Form.Label>                              
                                                        <Form.Control type="password" className="mb-0" id="exampleInputPassword6" placeholder="Password"
                                                            value={password}
                                                            onChange={(e) => setPassword(e.target.value)} required/>   
                                       </Form.Group>
                                    </Col>
                                    <Col md="6">
                                       <Form.Group> 
                                          <Form.Label>Repeat Password</Form.Label>                                
                                            <Form.Control type="password" className="mb-0" id="exampleInputPassword7" placeholder="Password"
                                                value={confirmPassword}
                                                onChange={(e) => setConfirmPassword(e.target.value)} required/>
                                       </Form.Group>
                                    </Col>
                                 </Row>
                                   {/*  <Col md="6">
                                       <Form.Group>
                                          <Form.Label>First Name</Form.Label>
                                          <Form.Control type="text" className="mb-0" id="exampleInputEmail4" placeholder="First Name" autoComplete="off" required/>
                                       </Form.Group>
                                    </Col>
                                    <Col md="6">
                                       <Form.Group>  
                                          <Form.Label>Last Name</Form.Label>                               
                                          <Form.Control type="email" className="mb-0" id="exampleInputEmail5" placeholder="Last Name" autoComplete="off" required/>
                                       </Form.Group>
                                    </Col> */}
                               {/*   <div className="custom-control custom-radio mt-2">
                                    <input type="radio" id="customRadio1" name="customRadio" className="custom-control-input"/>
                                    <label className="custom-control-label" htmlFor="customRadio1">Premium-$39 / 3 Months
                                       with a 5 day free trial</label>
                                 </div>
                                 <div className="custom-control custom-radio mt-2">
                                    <input type="radio" id="customRadio2" name="customRadio" className="custom-control-input"/>
                                    <label className="custom-control-label" htmlFor="customRadio2"> Basic- $19 / 1 Month</label>
                                 </div>
                                 <div className="custom-control custom-radio mt-2">
                                    <input type="radio" id="customRadio3" name="customRadio" className="custom-control-input"/>
                                    <label className="custom-control-label" htmlFor="customRadio3">Free-Free</label>
                                 </div> */}

                                            <Card.Body>
                                                <p>Make this user a super admin?</p>
                                                <div className="custom-control custom-checkbox custom-control-inline">
                                                        <Form.Check.Input type="checkbox" className="custom-control-input" id="customCheck-t"
                                                            value={isSuperAdmin}
                                                            onChange={(e) => setIsSuperAdmin(e.target.checked)} />
                                                    <Form.Check.Label className="custom-control-label" htmlFor="customCheck-t"> Note that this user will be able to create and delete other users including you.</Form.Check.Label>
                                                </div>
                                            </Card.Body>
                                 <Button type="button" onClick={registerHandler}  variant="btn btn-primary my-2">Create User</Button>
                              </Form>
                                    </Col>
                                </Row>
                            </Card.Body>
                        </Card>
                    </Col>
                </Row>
            </Container>

       </>
    )
}
export default AddAdmin;