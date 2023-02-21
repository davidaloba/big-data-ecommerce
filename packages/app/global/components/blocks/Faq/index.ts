import QuestionsAnswers from './questions-answers'

const Faq = ({ title, faq, theme }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className={`bg-${theme} py-40 px-4`}>
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="mx-auto max-w-6xl flex flex-col md:flex-row">
        // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
        {title && (
          // @ts-expect-error TS(2304): Cannot find name 'h2'.
          <h2
            // @ts-expect-error TS(2304): Cannot find name 'className'.
            className={`mr-8 w-full md:w-1/3 text-3xl text-${theme}-text font-extrabold leading-9`}>
            // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
            {title}
          </h2>
        )}
        // @ts-expect-error TS(2709): Cannot use namespace 'QuestionsAnswers' as a type.
        <QuestionsAnswers
          // @ts-expect-error TS(2304): Cannot find name 'items'.
          items={faq}
          // @ts-expect-error TS(2304): Cannot find name 'theme'.
          theme={theme}
        />
      </div>
    </div>
  )
}

Faq.defaultProps = {}

export default Faq
