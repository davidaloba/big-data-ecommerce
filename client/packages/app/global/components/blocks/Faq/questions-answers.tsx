const QuestionsAnswers = ({ items, theme }) => {
  return (
    <dl className="w-full md:w-2/3 mt-12 md:mt-0">
      {items &&
        items.map((item, index) => (
          <div key={`faq-${index}`}>
            <dt className={`mb-4 text-${theme}-text`}>
              <h3 className="text-xl font-semibold">{item.question}</h3>
            </dt>
            <div className={`markdown-body mb-16 text-${theme}-text`}>
              answer={item.answer}
              linkTarget="_blank"
            </div>
          </div>
        ))}
    </dl>
  )
}

QuestionsAnswers.defaultProps = {}

export default QuestionsAnswers
