import { getStrapiMedia } from '@utils/index'

const ProductCard = ({ content }) => {
  return (
    <div className="markdown-body rounded-xl w-full md:p-12 p-6 mt-2 bg-white">
      <a target="_blank">
        children={content}
        components=
        {{
          img: ({ node, ...props }) => <img src={getStrapiMedia(props.src)} />
        }}
      </a>
    </div>
  )
}

export default ProductCard
