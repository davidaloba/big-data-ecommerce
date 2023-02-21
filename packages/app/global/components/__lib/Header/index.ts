const Header = ({ theme, label, title }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'div'.
    <div className="text-center pt-24">
      {label && (
        // @ts-expect-error TS(2304): Cannot find name 'h2'.
        <h2 className={`text-${theme} font-extrabold tracking-wide uppercase`}>
          {label}
        </h2>
      )}

      // @ts-expect-error TS(2304): Cannot find name 'title'.
      {title && (
        // @ts-expect-error TS(2304): Cannot find name 'p'.
        <p className="mt-2 text-3xl leading-8 font-extrabold tracking-tight text-gray-900 dark:text-white sm:text-4xl">
          // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
          {title}
        </p>
      )}
    </div>
  )
}

export default Header
