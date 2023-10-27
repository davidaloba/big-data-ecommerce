import Image from './image'
import Text from './text'
import Button from './button'

const Repeatable = ({ style, text, image, button }) => {
  return (
    <div className={style && style.container}>
      <div className={style && style.wrapper}>
        {image && <Image text={image} />}
        {text && <Text text={text} />}
        {button && <Button text={button} />}
      </div>
    </div>
  )
}

export default Repeatable
