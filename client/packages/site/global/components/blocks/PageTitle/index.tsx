const PageTitle = ({ title, text, theme }) => {
  return (
    <section className="py-0 md:h-48 bg-gray-100">
      <h1 className=" text-5xl md:text-9xl font-bold pt-20 text-center md:text-left">{title}.</h1>
      {text && (
        <h3 className=" text-5xl md:text-9xl font-bold pt-20 text-center md:text-left">{text}.</h3>
      )}
    </section>
  )
}

PageTitle.defaultProps = {}

export default PageTitle
