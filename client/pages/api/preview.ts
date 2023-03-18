import { getData } from '@marketingUtils/index'

export default async (req, res) => {
  if (
    req.query.secret !== process.env.PREVIEW_SECRET ||
    (req.query.slug != '' && !req.query.slug)
  ) {
    return res.status(401).json({ message: 'Invalid token' })
  }

  const { slug, preview } = getData(req.query.req.query.kind, null)

  if (!preview) {
    return res.status(401).json({ message: 'Invalid slug' })
  }
  res.setPreviewData({})

  res.writeHead(307, {
    Location: slug
  })

  res.end()
}
