import CustomLink from '@components/__lib/CustomLink'

const Cta = ({ href, target, label }) => {
  return (
    // @ts-expect-error TS(2304): Cannot find name 'button'.
    <button
      // @ts-expect-error TS(2304): Cannot find name 'type'.
      type="button"
      // @ts-expect-error TS(2304): Cannot find name 'className'.
      className="py-4 px-6 bg-primary hover:bg-primary-darker text-white transition ease-in duration-200 text-center text-base font-semibold shadow-md rounded-full hidden lg:block">
      // @ts-expect-error TS(2709): Cannot use namespace 'CustomLink' as a type.
      <CustomLink
        href={href}
        target={target}
        label={label}
        // @ts-expect-error TS(2552): Cannot find name 'isExternal'. Did you mean 'Exter... Remove this comment to see the full error message
        isExternal={true}
      />
    </button>
  )
}

export default Cta
