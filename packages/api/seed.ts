import Product from 'packages/db/models/products'
import data from 'packages/content/data'
import db from 'packages/db'

const handler = async (req, res) => {
  await db.connect()
  await Product.deleteMany()
  await Product.insertMany(data.products)
  await db.disconnect()
  res.send({ message: 'seeded successfully' })
}
export default handler
