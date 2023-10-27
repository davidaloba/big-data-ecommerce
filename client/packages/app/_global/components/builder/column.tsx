import { getStrapiMedia } from '@app/_global/utils/index'
import Element from './element'
import { useRouter } from 'next/router'
import Repeatable from './repeatable'

const Column = ({ style, link, bgColor, bgImage, elements }) => {
  const classes = {
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
      style={classes}
      className={`flex flex-col ${
        link ? 'cursor-pointer' : ' cursor-default pointer-events-none'
      }`}>
      <Repeatable
        Element={Element}
        elements={elements}
        style={{
          container: `flex flex-row flex-wrap items-center justify-end  capitalize`,
          wrapper: 'flex-1 mt-2 md:mt-0   '
        }}
        pre="headerLink"
      />
    </div>
  )
}

export default Column
