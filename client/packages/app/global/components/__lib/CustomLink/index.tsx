import Link from 'next/link'

const CustomLink = ({ label, href, target, isExternal }) => {
  if (isExternal) {
    return (
      <Link
        href={href}
        target={target}>
        {label}
      </Link>
    )
  } else {
    return (
      <Link
        href={href}
        target={target}>
        {label}
      </Link>
    )
  }
}

export default CustomLink
