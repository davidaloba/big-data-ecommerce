import Image from 'next/image'

const Hero = ({ images, header, text, buttons }) => {
  const title = header.title

  return (
    <section className=" md:min-h-[50vh] xl:min-h-[80vh] py-4 md:py-20 flex items-center ">
      <div className=" flex flex-col md:flex-row md:flex-grow  justify-around items-center">
        <div className="w-full md:w-2/4 md:px-4 xl:px-8 md:text-left text-center">
          <div className=" my-2 text-orange-500 text-4xl md:text-4xl lg:text-6xl font-bold">
            Hi!
          </div>
          <h2 className=" mt-4 xl:mt-8 text-2xl md:text-3xl xl:text-5xl font-semibold">
            I'm David, a software engineer passionate about afrocentric startups.
          </h2>
        </div>

        <div className="md:w-2/4 mt-16 md:mt-0 w-full ">
          <div className="flex flex-col items-center md:flex-none ">
            <Image
              src={'/avatar.jpg'}
              alt="avatar"
              width={480}
              height={480}
              className="shadow rounded-lg"
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
