'use client'

import { getStrapiMedia } from '@app/_global/utils/index'
import Link from 'next/link'
import Image from 'next/image'
import Repeatable from '@app/_global/components/__lib/Repeatable'
import ArticleCard from './article-card'
import { useGetNavigationQuery } from '../../store/articles.api'

const Article = ({
  slug,
  title,
  featuredImage,
  relatedArticles: { data: relatedArticles },
  topic,
  content
}) => {
  const createMarkup = () => {
    return { __html: content }
  }
  const { data: nav, isSuccess } = useGetNavigationQuery(slug)

  return (
    <>
      <section
        className="px-4 md:px-6 lg:px-8 2xl:px-12 py-3
        flex flex-row  items-center justify-between bg-white border-t">
        <div className="flex flex-row flex-1">
          <Link
            className={`block mx-1 uppercase`}
            href={`/blog`}>
            {`< Blog`}
          </Link>
          {isSuccess && (
            <div className=" flex flex-row ml-4 uppercase">
              {!nav.prev ? (
                <p className={`text-gray-400  block mx-1`}>Previous </p>
              ) : (
                <Link
                  className={` block mx-1`}
                  href={`${nav.prev}`}>
                  Previous{' '}
                </Link>
              )}
              |
              {!nav.next ? (
                <p className={`text-gray-400  block mx-1`}>Next </p>
              ) : (
                <Link
                  className={` block mx-1`}
                  href={`${nav.next}`}>
                  Next{' '}
                </Link>
              )}
            </div>
          )}
        </div>
        <div className="uppercase  ">{title}</div>
        <Link
          className={`block uppercase self-end flex-1 text-right `}
          href={`#`}>
          {topic && topic.data && topic.data.attributes.name}
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
            </div>
            <div
              className="editor mt-10 px-10 xs:px-20 md:px-30 lg:px-40 "
              dangerouslySetInnerHTML={createMarkup()}></div>
          </article>
        </div>
      </section>
      {relatedArticles.length > 0 && (
        <section className="px-4 md:px-6 lg:px-8 2xl:px-12 py-0 mt-20 text-gray-600 body-font ">
          <div className="md:mt-12 lg:mt-20">
            <h1
              className="flex flex-row min-w-56 align gap-
            uppercase ">
              WE ALSO RECOMMEND
            </h1>
            <Repeatable
              Element={ArticleCard}
              elements={relatedArticles}
              style={{
                container: `mt-6
                  flex flex-wrap flex-row gap-6 md:gap-4
                 `,
                wrapper: `w-[40%] md:w-max `
              }}
              pre="category"
            />
          </div>
        </section>
      )}
    </>
  )
}

export default Article
