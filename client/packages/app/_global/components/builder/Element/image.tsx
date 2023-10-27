const Image = ({ image }) => {
  const createMarkup = () => {
    return { __html: text }
  }
  return (
    <div
      className="editor mt-10"
      dangerouslySetInnerHTML={createMarkup()}></div>
  )
}

export default Image
