const PageTitle = ({ title, text, theme }) => {
  return (
    <section className="py-0 -m-2 xl:-m-4 bg-gray-100">
      <h1 className=" text-5xl md:text-7xl xl:text-9xl font-bold pt-20 text-left">{title}.</h1>
      {text && (
        <h3 className=" text-5xl md:text-9xl font-bold pt-20 text-center md:text-left">{text}.</h3>
      )}
    </section>
  )
}

export default PageTitle
