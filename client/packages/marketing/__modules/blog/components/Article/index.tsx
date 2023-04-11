import RelatedArticles from './related-articles'
import Link from 'next/link'
import { getStrapiMedia, getStrapiURL } from 'packages/global/utils/index'
import Image from 'next/image'

const Article = ({ slug, title, featuredImage, topic, author, content, publishedAt }) => {
  console.log(author)
  const published = new Date(publishedAt).toUTCString().slice(4, 17)

  const createMarkup = () => {
    return { __html: content }
  }

  return (
    <>
      <section className="text-gray-600 body-font py-24">
        <div className="text-center">Blog / {topic.data.attributes.name}</div>
        <h1 className="font-black sm:text-5xl text-4xl mt-10 mb-4 text-gray-900 text-center">
          {title}
        </h1>

        <div className="flex flex-col 2xl:flex-row gap-10 mt-10">
          <article>
            <div className=" relative flex flex-col items-center  px-8">
              <div className="flex flex-col 2xl:flex-row items-center gap-4 2xl:gap-8">
                <Link
                  href={`/author/${author}`}
                  className="2xl:min-w-[80px]">
                  <Image
                    src={getStrapiMedia(author.data.attributes.avatar.data.attributes.url)}
                    width="72"
                    height="72"
                    alt={author.data.attributes.name}
                  />
                </Link>
                <p className="text-center">{author.data.attributes.bio}</p>
              </div>
              <div className="absolute top-4 2xl:relative flex flex-row min-w-[380px] justify-between items-center">
                <div className="blog-post-header__item">
                  <svg
                    className="fill-secondary"
                    width="16"
                    height="16">
                    <use xlinkHref="#tag"></use>
                  </svg>
                  <a href="https://www.lean-labs.com/blog/topic/growth-marketing">
                    {topic.data.attributes.name}
                  </a>
                </div>
                <div className="blog-post-header__item">
                  <svg
                    className="fill-secondary"
                    width="16"
                    height="16">
                    <use xlinkHref="#calendar"></use>
                  </svg>
                  {published}
                </div>
              </div>
            </div>
            <div className="mx-auto mt-10 2xl:mt-16 shadow-lg rounded-lg overflow-hidden">
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
            <Link href={`/blog`}>
              <button
                type="button"
                className="ml-2 py-4 mt-8 px-6 bg-secondary hover:bg-secondary-darker text-gray-50 w-1/8 text-center ase font-semibold shadow-sm rounded-md">
                Back to articles
              </button>
            </Link>
          </article>
          <aside className=" min-w-[30%]"></aside>
        </div>
      </section>
      {/* <RelatedArticles related={related} /> */}
    </>
  )
}

export default Article
