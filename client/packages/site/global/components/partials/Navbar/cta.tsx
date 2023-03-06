import CustomLink from '@siteComponents/__lib/CustomLink'

const Cta = ({ href, target, label }) => {
  return (
    <button
      type="button"
      className="py-4 px-6 bg-primary hover:bg-primary-darker text-gray-50 transition ease-in duration-200 text-center text-base font-semibold shadow-md rounded-full hidden lg:block">
      <CustomLink
        href={href}
        target={target}
        label={label}
        isExternal={true}
      />
    </button>
  )
}

export default Cta
