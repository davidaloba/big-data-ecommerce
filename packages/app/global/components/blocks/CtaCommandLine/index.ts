import Container from '@components/__lib/Container'

const CtaCommandLine = ({ title, text, theme, commandLine }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className={`bg-${theme}`}>
      // @ts-expect-error TS(2304): Cannot find name 'div'.
      <div className="text-center w-full mx-auto py-12 px-4 sm:px-6 lg:py-16 lg:px-8 z-20">
        // @ts-expect-error TS(2304): Cannot find name 'h2'.
        <h2 className={`text-3xl font-extrabold text-black sm:text-4xl`}>
          // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
          {title && <span className="block">{title}</span>}
          // @ts-expect-error TS(2552): Cannot find name 'text'. Did you mean 'Text'?
          {text && <span className={`block text-white`}>{text}</span>}
        </h2>
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="py-12 lg:flex-shrink-0 flex items-center justify-center">
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="block md:w-2/5 w-full shadow-2xl text-center">
            // @ts-expect-error TS(2709): Cannot use namespace 'Container' as a type.
            <Container
              // note="code-block"
              // @ts-expect-error TS(2304): Cannot find name 'text'.
              text={commandLine}
              // @ts-expect-error TS(2304): Cannot find name 'language'.
              language="bash"
              // @ts-expect-error TS(2304): Cannot find name 'codeBlock'.
              codeBlock
              // theme={}
              // @ts-expect-error TS(2304): Cannot find name 'showLineNumbers'.
              showLineNumbers={false}
            />
          </div>
        </div>
      </div>
    </div>
  )
}

CtaCommandLine.defaultProps = {}

export default CtaCommandLine
