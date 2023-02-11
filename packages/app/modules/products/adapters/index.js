export const productAdapter = ({
  slug,
  images,
  name,
  information,
  category,
  locale
}) => {
  return {
    images,
    name,
    slug,
    information,
    category,
    locale
  }
}

export const productsAdapter = (products) => {
  return products.map((product) => productAdapter({ ...product }))
}
