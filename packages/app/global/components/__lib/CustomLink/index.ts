import Link from 'next/link'

const CustomLink = ({ label, href, locale, target, isExternal }) => {
  if (isExternal) {
    return (
      // @ts-expect-error TS(2749): 'Link' refers to a value, but is being used as a t... Remove this comment to see the full error message
      <Link
        href={href}
        // @ts-expect-error TS(2365): Operator '>' cannot be applied to types '{ target:... Remove this comment to see the full error message
        target={target}>
        {label}
      </Link>
    )
  } else {
    return (
      <Link
        href={`${href}?lang=${locale || 'en'}`}
        // @ts-expect-error TS(2304): Cannot find name 'target'.
        target={target}>
        // @ts-expect-error TS(18004): No value exists in scope for the shorthand propert... Remove this comment to see the full error message
        {label}
      </Link>
    )
  }
}

CustomLink.defaultProps = {}

export default CustomLink
