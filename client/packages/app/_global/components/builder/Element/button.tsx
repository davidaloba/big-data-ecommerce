const Button = ({ text }) => {
  const createMarkup = () => {
    return { __html: text }
  }
  return (
    <div
      className="editor mt-10"
      dangerouslySetInnerHTML={createMarkup()}></div>
  )
}

export default Button
