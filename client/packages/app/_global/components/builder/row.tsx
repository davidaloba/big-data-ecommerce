import { getStrapiMedia } from '@app/_global/utils/index'
import Column from './column'
import NoResults from '@app/_global/components/__lib/no-results'
import { useRouter } from 'next/router'

const Row = ({ style, link, bgColor, bgImage, columns }) => {
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
      {columns ? (
        columns.map((column, index) => (
          <Column
            key={`column-${index}`}
            {...column}
          />
        ))
      ) : (
        <NoResults />
      )}
    </div>
  )
}

export default Row
