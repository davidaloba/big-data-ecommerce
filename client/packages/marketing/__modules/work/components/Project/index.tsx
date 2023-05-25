import { getStrapiMedia } from 'packages/global/utils/index'
import Link from 'next/link'
import Image from 'next/image'
import Repeatable from '@globalComponents/__lib/Repeatable'
import ProjectCard from './project-card'

const Project = ({
  title,
  featuredImage,
  kind,
  relatedProjects: { data: relatedProjects },
  content,
  mockup,
  description
}) => {
  const createMarkup = () => {
    return { __html: description }
  }

  return (
    <>
      <section
        className="px-4 md:px-6 lg:px-8 2xl:px-12 py-3
      flex flex-row  items-center justify-between bg-white border-t">
        <div className="flex flex-row flex-1">
          <Link
            className={`block mx-1 uppercase`}
            href={`/work`}>
            {`< Work`}
          </Link>
          {/*  
        // TODO: Add NEXT | PREV buttons
        <div className=" flex flex-row ml-4 uppercase">
          <Link
          className={`block mx-1`}
          href={`#`}>
          Previous{' '}
          </Link>
          |
          <Link
          className={`block mx-1`}
          href={`#`}>
          Next{' '}
          </Link>
        </div> */}
        </div>
        <div className="uppercase  ">{title}</div>
        <Link
          className={`block uppercase self-end flex-1 text-right `}
          href={`kind`}>
          {kind && kind.data.attributes && kind.data.attributes.name}
        </Link>
      </section>
      <section className="px-4 md:px-6 lg:px-8 2xl:px-12 py-0 text-gray-600 body-font ">
        <div className="flex flex-col 2xl:flex-row ">
          <article>
            <div className="mx-auto  2xl:mt-16 shadow-lg  overflow-hidden">
              <Image
                alt={title}
                className="object-cover object-center h-full w-full"
                src={getStrapiMedia(featuredImage.data.attributes.url)}
                width={1366}
                height={720}
              />
              {/* <div className="flex flex-col sm:flex-row mt-10 items-center justify-center"></div> */}
            </div>
            <div
              className="editor mt-10"
              dangerouslySetInnerHTML={createMarkup()}></div>
          </article>
        </div>
      </section>
      {relatedProjects.length > 0 && (
        <section className="px-4 md:px-6 lg:px-8 2xl:px-12 py-0 text-gray-600 body-font ">
          <div className="md:mt-12 lg:mt-20">
            <h1
              className="flex flex-row min-w-56
            uppercase ">
              WE ALSO RECOMMEND
            </h1>
            <Repeatable
              Element={ProjectCard}
              elements={relatedProjects}
              style={{
                container: `mt-6
                  flex flex-col gap-4 
                  md:grid md:grid-cols-4  md:gap-8`,
                wrapper: `md:col-span-1 md:col-span-1`
              }}
              pre="category"
            />
          </div>
        </section>
      )}
    </>
  )
}

export default Project
