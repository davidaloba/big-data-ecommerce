import React, { Fragment, useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import { Container, Row, Col, OverlayTrigger, Tooltip, Button, Form } from 'react-bootstrap'
import { useDispatch, useSelector } from "react-redux";
import axios from 'axios'
import { fetchData, fetchAdminMessages, getPeriod } from '../../../store/action'
import Card from '../../components/Card'


const MessageList = () => {
    const { userInfo } = useSelector((state) => state.user)
    const { messages, loading } = useSelector((state) => state.admin)
    const dispatch = useDispatch

    const [editMessage, setEditMessage] = useState(null)
    const [title, setTitle] = useState('')
    const [preacher, setPreacher] = useState('')
    const [thumbnail, setThumbnail] = useState('Upload Thumbnail')
    const [category, setCategory] = useState('')
    const [quality, setQuality] = useState('')
    const [description, setDescription] = useState('')
    const [duration, setDuration] = useState('')
    const categories = ['holdingForth', 'holyhill', 'livingAnswer', 'presentTruth']

    useEffect(() => {
        fetchData('/api/messages', userInfo.token, fetchAdminMessages)
    },[loading])

    const [loadingThumbUpload, setLoadingThumbUpload] = useState(false)
    const [thumbUploadError, setThumbUploadError] = useState('')
    const uploadThumbHandler = async (e) => {
        const file = e.target.files[0]
        const bodyFormData = new FormData()
        bodyFormData.append('thumb', file)
        setLoadingThumbUpload(true)
        try {
            const { data } = await axios.post(`/api/uploads/thumbnail?title=${title}&preacher=${preacher}`,
                bodyFormData,
                {
                    headers: {
                        'Content-Type': 'multipart/form-data',
                        Authorization: `Bearer ${userInfo.token}`
                    }
                })
            setThumbnail(data)
            console.log(data)
            setLoadingThumbUpload(false)
        } catch (err) {
            setThumbUploadError(err.response.data.message)
            setLoadingThumbUpload(false)
        }
    }

    const deleteHandler = async (messageID) => {
        if (!window.confirm('Are you sure you want to delete this message?')) {
            return
        }
        // dispatch(fetchAdminMessages(null))
        try {
            const { data } = await axios.delete(`/api/messages/${messageID}`, {
                headers: { authorization: `Bearer ${userInfo.token}` }
            })
            fetchData('/api/admin', userInfo.token, fetchAdminMessages)
            alert(data.response)
        } catch (err) {
            alert(err.response.data.message)
            console.log(err);
        }
    }

    const editHandler = async (messageID) => {
        if (!window.confirm('Are you sure?')) {
            return
        }
        try {
            const { data } = await axios.put(`/api/messages/${messageID}`,
                {
                    title: title,
                    preacher: preacher,
                    thumbnail: thumbnail,
                    category: category,
                    quality: quality,
                    description: description,
                    duration: duration,
                },
                {
                    headers: { authorization: `Bearer ${userInfo.token}` }
                }
            )
            fetchData('/api/messages', userInfo.token, fetchAdminMessages)
            setEditMessage(null)
            alert(`${data.message} `)
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
                                    <h4 className="card-title">Messages</h4>
                                </Card.Header.Title>
                                <div className="iq-card-header-toolbar d-flex align-items-center">
                                    <Link to="/add-message" className="btn btn-primary">Add message</Link>
                                </div>
                            </Card.Header>
                            <Card.Body>
                                <div className="table-view">
                                    <table className="data-tables table message_table " style={{ width: "100%" }}>
                                        <thead>
                                            <tr>
                                                <th>Message</th>
                                                <th>Preacher</th>
                                                <th>Quality</th>
                                                <th>Category</th>
                                                <th style={{ width: "20%" }}>Description</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        {!messages
                                            ? <tbody className=' text-3xl font-bold'><tr><td>loading...</td></tr></tbody>
                                            : <tbody>
                                                {messages.length > 0
                                                    ? (messages.map((message) => (<Fragment key={message._id} >
                                                        <tr className='border-2' >
                                                            <td>
                                                                <div className="media align-items-center">
                                                                    <div className="iq-message">
                                                                        <a href={message.thumbnail} target='_blank' rel="noreferrer" >
                                                                            <img src={message.thumbnail} className="img-border-radius avatar-40 img-fluid" alt="" />
                                                                        </a>
                                                                    </div>
                                                                    <div className="media-body text-white text-left ml-3">
                                                                        <p className="mb-0">{message.title}</p>
                                                                        <small>{getPeriod(message.duration)}</small>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>{message.preacher}</td>
                                                            <td>{message.quality}</td>
                                                            <td>{message.category}</td>
                                                            <td>
                                                                <p className="m-0">
                                                                    {message.description && message.description.substring(0, 100)} {message.description && message.description.length >= 100 && '... '}
                                                                </p>
                                                            </td>
                                                            <td>
                                                                <div className="flex align-items-center list-user-action">
                                                                    <OverlayTrigger placement="top" overlay={<Tooltip>View</Tooltip>}>
                                                                        <a className="iq-bg-warning" href={`http://${message.video}`} target='_blank' rel="noreferrer"><i className="lar la-eye"></i></a>
                                                                    </OverlayTrigger>
                                                                    <OverlayTrigger placement="top" overlay={<Tooltip>Edit</Tooltip>}>
                                                                        <Link className="iq-bg-success"
                                                                            onClick={() => {
                                                                                setEditMessage(message._id)
                                                                                setTitle(message.title)
                                                                                setPreacher(message.preacher)
                                                                                setCategory(message.category)
                                                                                setQuality(message.quality)
                                                                                setDescription(message.description)
                                                                                setDuration(message.duration)
                                                                            }} to="#"><i className="ri-pencil-line"></i></Link>
                                                                    </OverlayTrigger>
                                                                    <OverlayTrigger placement="top" overlay={<Tooltip>Delete</Tooltip>}>
                                                                        <Link className="iq-bg-primary" onClick={() => deleteHandler(message._id)} to="#"><i className="ri-delete-bin-line"></i></Link>
                                                                    </OverlayTrigger>
                                                                </div>

                                                            </td>
                                                        </tr>
                                                        {editMessage === message._id && <tr className="sign-in-page-data">
                                                            <td colspan={6} className="sign-in-from w-100 m-auto">
                                                                <Card>
                                                                    <Card.Body>
                                                                        <Form>
                                                                            <Row>
                                                                                <Form.Group className="col-6">
                                                                                    <Form.Control type="text" placeholder="Title"
                                                                                        value={title}
                                                                                        onChange={(e) => setTitle(e.target.value)} required />
                                                                                </Form.Group>
                                                                                <Form.Group className="col-6">
                                                                                    <Form.Control type="text" placeholder="Preacher"
                                                                                        value={preacher}
                                                                                        onChange={(e) => setPreacher(e.target.value)} required />
                                                                                </Form.Group>
                                                                                <Form.Group className="col-md-6">
                                                                                    <select className="form-control" id="exampleFormControlSelect1"
                                                                                        value={category}
                                                                                        onChange={(e) => setCategory(e.target.value)} required>
                                                                                        <option disabled>Message Category</option>
                                                                                        {categories.map((category, index) => <option key={index}>{category}</option>)}
                                                                                    </select>
                                                                                </Form.Group>
                                                                                <Form.Group className="form-group col-6">
                                                                                    <select className="form-control" id="exampleFormControlSelect2"
                                                                                        value={quality}
                                                                                        onChange={(e) => setQuality(e.target.value)} required>
                                                                                        <option disabled>Choose quality</option>
                                                                                        <option>FULLHD</option>
                                                                                        <option>HD</option>
                                                                                    </select>
                                                                                </Form.Group>
                                                                                <Form.Group className="col-6">
                                                                                    <Form.Control as="textarea" id="text" name="text" rows="5"
                                                                                        placeholder="Description"
                                                                                        value={description}
                                                                                        onChange={(e) => setDescription(e.target.value)} required></Form.Control>
                                                                                </Form.Group>
                                                                                <Form.Group sm="6" className="col-6 form-group">
                                                                                    <Form.Group >
                                                                                        <Form.Control type="" placeholder="Message Duration"
                                                                                            value={duration}
                                                                                            onChange={(e) => setDuration(e.target.value)} />
                                                                                    </Form.Group>
                                                                                    <Form.Group >
                                                                                        <Form.Group className=" form_gallery form-group">
                                                                                            <label id="gallery2" htmlFor="form_gallery-upload">{thumbnail}</label>
                                                                                            <input data-name="#gallery2" id="form_gallery-upload" className="form_gallery-upload"
                                                                                                type="file" accept=".png, .jpg, .jpeg"
                                                                                                onChange={uploadThumbHandler} required />
                                                                                            {loadingThumbUpload && <div>Uploading...</div>}
                                                                                            {thumbUploadError && (<div variant="danger">{thumbUploadError}</div>)}
                                                                                        </Form.Group>
                                                                                    </Form.Group>
                                                                                    <Form.Group >
                                                                                        <Form.Group className="">
                                                                                            <Button type="button" onClick={() => editHandler(message._id)} variant="primary">Submit</Button>{' '}
                                                                                            <Button type="reset" variant="danger">Cancel</Button>
                                                                                        </Form.Group>
                                                                                    </Form.Group>
                                                                                </Form.Group>
                                                                            </Row>
                                                                        </Form>
                                                                    </Card.Body>
                                                                </Card>
                                                            </td>
                                                        </tr>}
                                                    </Fragment>)))
                                                    : <tr className='border-2 font-italic ' > <td className=' px-10 py-4 italic' >No messages...</td></tr>
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
export default MessageList;