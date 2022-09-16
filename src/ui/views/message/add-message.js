import React, { useState } from 'react'
import { useDispatch, useSelector } from "react-redux";
import { Container, Row, Col, Form, Button } from 'react-bootstrap'
import {useHistory} from 'react-router-dom'
import axios from 'axios'

import Card from '../../components/Card'

const AddMessage = () => { 
    let router = useHistory()
    const { userInfo } = useSelector((state) => state.user)

    const [title, setTitle] = useState('')
    const [preacher, setPreacher] = useState('')
    const [thumbnail, setThumbnail] = useState('')
    const [category, setCategory] = useState('')
    const [quality, setQuality] = useState('')
    const [description, setDescription] = useState('')
    const [video, setVideo] = useState('')
    const [duration, setDuration] = useState('')

    const createHandler = async () => {
        if (!window.confirm('Are you sure?')) {
            return
        }
        try {
            const { data } = await axios.post('/api/messages',
                {
                    title: title,
                    preacher: preacher,
                    thumbnail: thumbnail,
                    category: category,
                    quality: quality,
                    description: description,
                    video: video,
                    duration: duration,
                },
                {
                    headers: { authorization: `Bearer ${userInfo.token}` }
                }
            )
            alert(`${data.message} `)
             router.push('/message-list')
        } catch (err) {
            alert(err.response.data.message)
        }
    }

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
            { headers: {
                    'Content-Type': 'multipart/form-data',
                    Authorization: `Bearer ${userInfo.token}`
                } })
            setThumbnail(data)
            console.log(data)
            setLoadingThumbUpload(false)
        } catch (err) {
            setThumbUploadError(err.response.data.message)
            setLoadingThumbUpload(false)
        }
    }

    const [loadingUpload, setLoadingUpload] = useState(false)
    const [errorUpload, setErrorUpload] = useState('')
    const uploadVideoHandler = async (e) => {
        const file = e.target.files[0]
        const bodyFormData = new FormData()
        bodyFormData.append('video', file)
        setLoadingUpload(true)
        try {
            const { data } = await axios.post(`/api/uploads/video?title=${title}&preacher=${preacher}`, 
            bodyFormData, 
            { headers: {
                    'Content-Type': 'multipart/form-data',
                    Authorization: `Bearer ${userInfo.token}`
                } })
            setVideo(data)
            setLoadingUpload(false)
        } catch (err) {
            setErrorUpload(err.response.data.message)
            setLoadingUpload(false)
        }
    }
    
    const categories = ['holdingForth', 'holyhill', 'livingAnswer', 'presentTruth']


    return (
            <> 
                <Container fluid>
                    <Row>   
                        <Col sm="12">
                            <Card>
                                <Card.Header className="d-flex justify-content-between">
                                    <Card.Header.Title>
                                        <h4 className="card-title">Add Movie</h4>
                                    </Card.Header.Title>
                                </Card.Header>
                                <Card.Body>
                                    <Form>
                                        <Row>
                                            <Col lg="7">
                                                <Row>
                                                    <Form.Group className="col-12">
                                                    <Form.Control type="text" placeholder="Title"
                                                        value={title}
                                                        onChange={(e) => setTitle(e.target.value)} required />
                                                    </Form.Group>
                                                <Form.Group className="col-12">
                                                    <Form.Control type="text" placeholder="Preacher"
                                                        value={preacher}
                                                        onChange={(e) => setPreacher(e.target.value)} required/>
                                                </Form.Group>
                                                    <div className="col-12 form_gallery form-group">
                                                    <label id="gallery2" htmlFor="form_gallery-upload">{thumbnail ? `http://${thumbnail}` : 'Upload Thumbnail'}</label>

                                                        <input data-name="#gallery2" id="form_gallery-upload" className="form_gallery-upload"
                                                        type="file" accept=".png, .jpg, .jpeg"
                                                        onChange={uploadThumbHandler} required/>

                                                    {loadingThumbUpload && <div>Uploading...</div>}
                                                    {thumbUploadError && (<div variant="danger">{thumbUploadError}</div>)}
                                                    
                                                    </div>

                                                <Col sm="12" className="form-group">
                                                    <Form.Control type="" placeholder="Movie Duration"
                                                        value={duration}
                                                        onChange={(e) => setDuration(e.target.value)} />
                                                </Col>
                                                    <Form.Group className="col-md-6">
                                                    <select className="form-control" id="exampleFormControlSelect1"
                                                        value={category}
                                                        onChange={(e) => setCategory(e.target.value)} required>
                                                        <option disabled>Movie Category</option>
                                                        {categories.map((category, index) => <option key={index}>{category}</option>)}
                                                    </select>
                                                    </Form.Group>
                                                    <Col sm="6" className="form-group">
                                                    <select className="form-control" id="exampleFormControlSelect2"
                                                        value={quality}
                                                        onChange={(e) => setQuality(e.target.value)} required>
                                                            <option disabled>Choose quality</option>
                                                            <option>FULLHD</option>
                                                            <option>HD</option>
                                                        </select>
                                                    </Col>
                                                    <Form.Group className="col-12">
                                                    <Form.Control as="textarea" id="text" name="text" rows="5"
                                                        placeholder="Description"
                                                        value={description}
                                                        onChange={(e) => setDescription(e.target.value)} required></Form.Control>
                                                    </Form.Group>
                                                </Row>
                                            </Col>
                                            <Col lg="5">
                                                <div className="d-block position-relative">
                                                    <div className="form_video-upload">
                                                    <input type="file" accept="video/mp4,video/x-m4v,video/*" multiple
                                                        onChange={uploadVideoHandler} />
                                                    <p>{video ? `http://${video}` : 'Upload video'}</p>
                                                    {loadingUpload && <div>Uploading...</div>}
                                                    {errorUpload && (<div variant="danger">{errorUpload}</div>)}
                                                    </div>
                                                </div>
                                            </Col>
                                            
                                        </Row>
                                        <Row>
                                            <Form.Group className="col-12">
                                            <Button type="button" onClick={createHandler} variant="primary">Submit</Button>{' '}<Button type="reset" variant="danger" onClick={() => router.push('/')} >Cancel</Button>
                                            </Form.Group>
                                        </Row>
                                    </Form>
                                </Card.Body>
                            </Card>
                        </Col>
                    </Row>
                </Container>
            </>
        )
    }
export default AddMessage;