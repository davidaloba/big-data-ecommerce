import Container from '@components/__lib/Container'
import { getStrapiMedia } from '@utils/index'

const ProductCard = ({ content }) => {
  return (
    // @ts-expect-error TS(2709): Cannot use namespace 'Container' as a type.
    <Container>
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="markdown-body rounded-xl w-full md:p-12 p-6 mt-2 bg-white">
        // @ts-expect-error TS(2709): Cannot use namespace 'Container' as a type.
        <Container
          // @ts-expect-error TS(2304): Cannot find name 'children'.
          children={content}
          // @ts-expect-error TS(2304): Cannot find name 'linkTarget'.
          linkTarget="_blank"
          // @ts-expect-error TS(2304): Cannot find name 'components'.
          components={{
            // @ts-expect-error TS(2304): Cannot find name 'img'.
            img: ({ node, ...props }) => <img src={getStrapiMedia(props.src)} />
          // @ts-expect-error TS(2365): Operator '<' cannot be applied to types 'boolean' ... Remove this comment to see the full error message
          }}></Container>
      </div>
    </Container>
  )
}

export default ProductCard
