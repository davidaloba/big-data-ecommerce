import Product from 'packages/db/models/products'
import db from 'packages/db'

const handler = async (req, res) => {
  await db.connect()
  const product = await Product.findById(req.query.id)
  await db.disconnect()
  res.send(product)
}

export default handler
