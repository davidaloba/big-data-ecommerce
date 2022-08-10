import React, { Fragment, useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import {  useSelector } from "react-redux";
import { Container, Row, Col, OverlayTrigger, Tooltip, Button, Form } from 'react-bootstrap'
import { useHistory } from 'react-router-dom'
import axios from 'axios'
import { fetchData, fetchAdminUsers } from '../../../store/action'
import Card from '../../components/Card'

const AdminList = () => {
    const { userInfo } = useSelector((state) => state.user)
    const { admins, loading } = useSelector((state) => state.admin)
    let router =useHistory()

    const [editUser, setEditUser] = useState('')
    const [password, setPassword] = useState('')
    const [confirmPassword, setConfirmPassword] = useState('')


    useEffect(() => {
        if (!userInfo.isSuperAdmin) {
            router.push('/')
            // console.log(editUser);
        }
        loading && fetchData('/api/admin', userInfo.token, fetchAdminUsers)
    }, [loading, router, userInfo])


    const deleteHandler = async (userId) => {
        if (!window.confirm('Are you sure you want to delete this user?')) {
            return
        }
        try {
           const {data} = await axios.delete(`/api/admin/${userId}`, {
                headers: { authorization: `Bearer ${userInfo.token}` }
            })
            alert(data.message)
            fetchData('/api/admin', userInfo.token, fetchAdminUsers)
        } catch (err) {
            alert(err.response.data.message)
        }
    }

    const resetPasswordHandler = async () => {
        if (!window.confirm('Are you sure?')) {
            return
        }
        if (password !== confirmPassword) {
            alert('Password and confirm password do not match')
        }
        try {
            const { data } = await axios.put(`/api/admin/${editUser}`,
                { password: password },
                { headers: { authorization: `Bearer ${userInfo.token}` } }
            )
            alert(data.message)
            setEditUser('')
            setPassword('')
            setConfirmPassword('')
        } catch (err) {
            alert(err.response.data.message)
            setPassword('')
            setConfirmPassword('')
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
                                    <h4 className="card-title">Admin Lists</h4>
                                </Card.Header.Title>
                            </Card.Header>
                            <Card.Body>
                                <div className="table-view">
                                    <table className="data-tables table movie_table" style={{ width: "100%" }}>
                                        <thead>
                                            <tr>
                                                <th style={{ width: "10%" }}>Name</th>
                                                <th style={{ width: "20%" }}>Email</th>
                                                <th style={{ width: "10%" }}>Action</th>
                                            </tr>
                                        </thead>
                                        {!admins
                                            ? <tbody className=' text-3xl font-bold'><tr><td>loading...</td></tr></tbody>
                                            : <tbody>
                                                {admins.length > 0
                                                    ? (admins.map((admin) => (<Fragment key={admin.email} >
                                                        <tr className='border-2' >
                                                            <td>{admin.name}</td>
                                                            <td>{admin.email}</td>
                                                            <td>
                                                                <div className="flex align-items-center list-user-action">
                                                                    <OverlayTrigger placement="top" overlay={<Tooltip>Reset Password</Tooltip>}>
                                                                        <Link
                                                                            onClick={() => setEditUser(admin.email)} className="iq-bg-success" to="#"><i className="ri-pencil-line"></i></Link>
                                                                    </OverlayTrigger>
                                                                    <OverlayTrigger placement="top" overlay={<Tooltip>Delete</Tooltip>}>
                                                                        <Link onClick={() => deleteHandler(admin.email)} className="iq-bg-primary" to="#"><i className="ri-delete-bin-line"></i></Link>
                                                                    </OverlayTrigger>
                                                                </div>
                                                            </td>
                                                        </tr> 
                                                        { editUser === admin.email && 
                                                            <tr  className="sign-in-page-data">
                                                                <td colspan={3} className="sign-in-from w-100 m-auto">
                                                                    <Form className="mt-4" action="">
                                                                    <Row>
                                                                    <Col>
                                                                        <Form.Group>
                                                                            <Form.Control
                                                                                type="password"
                                                                                className="mb-0"
                                                                                id="password"
                                                                                placeholder="Password"
                                                                                value={password}
                                                                                onChange={(e) => setPassword(e.target.value)}
                                                                                required />
                                                                        </Form.Group>
                                                                            </Col>
                                                                            <Col>
                                                                        <Form.Group>
                                                                            <Form.Control
                                                                                type="password"
                                                                                className="mb-0"
                                                                                id="confirmPassword"
                                                                                placeholder="Confirm Password"
                                                                                value={confirmPassword}
                                                                                onChange={(e) => setConfirmPassword(e.target.value)}
                                                                                required />
                                                                        </Form.Group>
                                                                            </Col>
                                                                            <Col>
                                                                        <div className="sign-info">
                                                                            <Button type="button" onClick={resetPasswordHandler} variant="btn btn-primary">Reset Password</Button>
                                                                        </div>
                                                                            </Col>
                                                                        </Row>
                                                                    </Form>
                                                                </td>
                                                            </tr>
                                                        }
                                                    </Fragment> )))
                                                    : <tr className='border-2 font-italic ' > <td className=' px-10 py-4 italic' >No users...</td></tr>
                                                }
                                            </tbody>}
                                    </table>
                                </div>
                            </Card.Body>
                        </Card>
                    </Col>
                </Row>
            </Container>

        </>
    )
}
export default AdminList;