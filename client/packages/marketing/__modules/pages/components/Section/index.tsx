import { getStrapiMedia } from '@globalUtils/index'
import Row from './row'
import { useRouter } from 'next/router'

const Section = ({ style, link, bgColor, bgImage, rows }) => {
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
    <section
      onClick={(e) => handleClick(e)}
      style={background}
      className={`flex flex-col ${
        link ? 'cursor-pointer' : ' cursor-default pointer-events-none'
      }`}>
      {rows.map((row, index) => (
        <Row
          key={`row-${index}`}
          {...row}
        />
      ))}
    </section>
  )
}

export default Section
