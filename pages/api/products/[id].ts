import Product from '@modules/products/model'
import db from '@utils/db'

const handler = async (req, res) => {
  await db.connect()
  const product = await Product.findById(req.query.id)
  await db.disconnect()
  res.send(product)
}

export default handler
