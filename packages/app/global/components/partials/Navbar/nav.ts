import Link from 'next/link'

const Nav = ({ links, locale }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'nav'.
    <nav className="text-xl mx-auto flex flex-wrap p-5 flex-col md:flex-row items-center">
      {links.map((link, index) => (
        // @ts-expect-error TS(2749): 'Link' refers to a value, but is being used as a t... Remove this comment to see the full error message
        <Link
          // @ts-expect-error TS(2304): Cannot find name 'href'.
          href={`${link.href}?lang=${locale || 'en'}`}
          // @ts-expect-error TS(2304): Cannot find name 'key'.
          key={`navigationLink-${index}`}
          // @ts-expect-error TS(2304): Cannot find name 'className'.
          className="md:mr-10 hover:text-gray-900">
          // @ts-expect-error TS(2552): Cannot find name 'link'. Did you mean 'Link'?
          {link.label}
        </Link>
      ))}
    </nav>
  )
}

export default Nav
