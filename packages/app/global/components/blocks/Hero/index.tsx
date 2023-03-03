import Image from 'next/image'
import CustomLink from '../../__lib/CustomLink'
import ImageCards from '../../__lib/image-cards'

const Hero = ({ images, header, text, buttons }) => {
  const title = header.title

  return (
    <section className="2xl:h-screen px-8 py-40 flex justify-center items-center ">
      <div className=" flex md:flex-row flex-col flex-grow justify-between items-center">
        <div className="w-full md:w-3/5 lg:py-20 md:px-10 md:text-left text-center">
          <h1 className="md:text-7xl text-4xl font-bold my-2">Web Developer.</h1>
          <h1 className="md:text-7xl text-4xl font-bold my-2">Product Manager.</h1>
        </div>

        <div className=" md:w-2/5 w-full lg:block hidden ">
          <div className="">
            <Image
              src={'/avatar.jpg'}
              alt="avatar"
              width={480}
              height={480}
              className="shadow"
            />
            <div className="flex flex-row justify-between mt-4">
              <div className="flex flex-row space-x-4">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="16"
                  height="16"
                  fill="currentColor"
                  className="bi bi-arrow-90deg-up"
                  viewBox="0 0 16 16">
                  <path
                    fillRule="evenodd"
                    d="M4.854 1.146a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L4 2.707V12.5A2.5 2.5 0 0 0 6.5 15h8a.5.5 0 0 0 0-1h-8A1.5 1.5 0 0 1 5 12.5V2.707l3.146 3.147a.5.5 0 1 0 .708-.708l-4-4z"
                  />
                </svg>
                <p className="font-mono">That's me</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  )
}

Hero.defaultProps = {}

export default Hero
