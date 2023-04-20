import { getStrapiMedia } from '@globalUtils/index'
import { useRouter } from 'next/router'

const Elements = ({ style, link, bgColor, bgImage, text, image, button, elements }) => {
  // { style, link, bgColor, bgImage, text, image, button }
  console.log(elements)

  const background = {
    backgroundImage:
      bgImage && bgImage.data && bgImage.data.attributes
        ? `url(${getStrapiMedia(bgImage.data.attributes.url)})`
        : '',
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
      }`}></div>
  )
}

export default Elements
