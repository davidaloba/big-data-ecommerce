import Link from 'next/link'

const Header = ({ theme, title, subtitle, text, link }) => {
  // const link = '/'
  return (
    <div className=" flex flex-col md:flex-row justify-between items-center">
      <div className={`${text && 'md:max-w-[50%]'}`}>
        {title && <h1 className=" text-4xl md:text-5xl lg:text-[80px] font-bold ">{title}</h1>}
        {subtitle && <h2 className="ml-4 mt-8 text-xl md:text-2xl lg:text-[20px]  ">{subtitle}</h2>}
      </div>
      <div>
        {text && <p className=" text-lg text-gray-500">{text}</p>}
        {link && (
          <Link
            target={link.target}
            href={link.href}
            className="mt-6 md:mt-0 md:px-8 px-4 md:py-4 py-2 rounded-md bg-white shadow-lg text-lg md:text-xl font-semibold flex flex-row space-x-4 items-center">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="16"
              height="16"
              fill="currentColor"
              className="bi bi-arrow-up-right-square"
              stroke="4"
              strokeWidth="4"
              viewBox="0 0 16 16">
              <path
                fillRule="evenodd"
                d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V2zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm5.854 8.803a.5.5 0 1 1-.708-.707L9.243 6H6.475a.5.5 0 1 1 0-1h3.975a.5.5 0 0 1 .5.5v3.975a.5.5 0 1 1-1 0V6.707l-4.096 4.096z"
              />
            </svg>
            <p>{link.label}</p>
          </Link>
        )}
      </div>
    </div>
  )
}

export default Header
