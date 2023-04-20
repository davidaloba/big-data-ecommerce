import { getStrapiMedia } from '@globalUtils/index'
import Elements from './elements'
import { useRouter } from 'next/router'

const Column = ({ style, link, bgColor, bgImage, elements }) => {
  const background = {
    backgroundImage:
      bgImage && bgImage.data && bgImage.data.attributes
        ? `url(${getStrapiMedia(bgImage.data.attributes.url)})`
        : null,
    backgroundColor: `${bgColor}` || '',
    ...style
  }

  const router = useRouter()
  const handleClick = (e) => {
    e.preventDefault()
    link.target === '_blank' ? window.open(link.href) : router.push(link.href)
  }

  return (
    <div
      onClick={(e) => handleClick(e)}
      style={background}
      className={`flex flex-col ${
        link ? 'cursor-pointer' : ' cursor-default pointer-events-none'
      }`}>
      <Elements elements={elements} />
    </div>
  )
}

export default Column
