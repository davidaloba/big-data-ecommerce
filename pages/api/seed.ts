import Product from '../../modules/products/model'
import data from '../../content/data'
import db from '../../global/utils/db'

const handler = async (req, res) => {
  await db.connect()
  await Product.deleteMany()
  await Product.insertMany(data.products)
  await db.disconnect()
  res.send({ message: 'seeded successfully' })
}
export default handler
