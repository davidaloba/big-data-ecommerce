import Container from '@components/__lib/Container'

const QuestionsAnswers = ({ items, theme }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'dl'.
    <dl className="w-full md:w-2/3 mt-12 md:mt-0">
      {items &&
        items.map((item, index) => (
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div key={`faq-${index}`}>
            // @ts-expect-error TS(2304): Cannot find name 'dt'.
            <dt className={`mb-4 text-${theme}-text`}>
              // @ts-expect-error TS(2304): Cannot find name 'h3'.
              <h3 className="text-xl font-semibold">{item.question}</h3>
            </dt>
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className={`markdown-body mb-16 text-${theme}-text`}>
              // @ts-expect-error TS(2709): Cannot use namespace 'Container' as a type.
              <Container
                // @ts-expect-error TS(2304): Cannot find name 'children'.
                children={item.answer}
                // @ts-expect-error TS(2304): Cannot find name 'linkTarget'.
                linkTarget="_blank"></Container>
            </div>
          </div>
        ))}
    </dl>
  )
}

QuestionsAnswers.defaultProps = {}

export default QuestionsAnswers
