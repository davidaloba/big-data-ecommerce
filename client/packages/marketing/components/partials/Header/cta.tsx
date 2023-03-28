import Link from 'next/link'

const Cta = ({ button }) => {
  return (
    <button
      type="button"
      className="py-4 px-6 bg-primary hover:bg-primary-darker text-gray-50 transition ease-in duration-200 text-center text-base font-semibold shadow-md rounded-full hidden lg:block">
      <Link
        href={button.href}
        target={button.target}
        /* isExternal={button.isExternal} */
      >
        {button.label}
      </Link>
    </button>
  )
}

export default Cta
