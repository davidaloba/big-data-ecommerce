import Container from '@components/__lib/Container'
import Link from 'next/link'

import styles from './ArticleContent.module.css'

import { getStrapiMedia } from '@utils/index'

const ArticleContent = ({ attributes }) => {
  const title = attributes.title
  const image = attributes.main.image
  const content = attributes.main.content.ckeditor_content
  const locale = attributes.locale

  return (
    <Container>
      <section className="text-gray-600 body-font py-24">
        <div className="container px-5 py-2 mx-auto flex flex-col justify-center items-center">
          <h1 className="font-black sm:text-5xl text-4xl  mb-4 text-gray-900 text-center">
            {title}
          </h1>

          <div className="lg:w-4/6 mx-auto mt-10">
            <div className="shadow-lg rounded-lg overflow-hidden">
              <img
                alt={image.data.attributes.alternativeText}
                className="object-cover object-center h-full w-full"
                src={getStrapiMedia(image.data.attributes.url)}
              />
            </div>
            <div className="flex flex-col sm:flex-row mt-10 items-center justify-center"></div>
          </div>
          <div className="markdown-body ck-content shadow-lg rounded-xl lg:w-4/6 w-full md:p-12 p-6 mt-2 bg-white">
            <div className={styles['ck-no-border']}>
              <Container>{content}</Container>
            </div>
          </div>
          <Link href={`/blog?lang=${locale}`}>
            <button
              type="button"
              className="ml-2 py-4 mt-8 px-6 bg-secondary hover:bg-secondary-darker text-white w-1/8 text-center text-base font-semibold shadow-sm rounded-md">
              Back to articles
            </button>
          </Link>
        </div>
      </section>
    </Container>
  )
}

ArticleContent.defaultProps = {}

export default ArticleContent
