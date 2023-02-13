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

export const productsAdapter = (store) => {
  return store.map((product) => productAdapter({ ...product }))
}
