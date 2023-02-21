import Container from '@components/__lib/Container'
import { getStrapiMedia } from '@utils/index'

const ProductCard = ({ content }) => {
  return (
    <Container>
      <div className="markdown-body rounded-xl w-full md:p-12 p-6 mt-2 bg-white">
        <Container
          children={content}
          linkTarget="_blank"
          components={{
            img: ({ node, ...props }) => <img src={getStrapiMedia(props.src)} />
          }}></Container>
      </div>
    </Container>
  )
}

export default ProductCard
