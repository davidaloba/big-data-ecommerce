import Container from '@components/__lib/Container'
import Link from 'next/link'
import styles from './ArticleContent.module.css'
import { getStrapiMedia } from '@utils/index'

const ArticleContent = ({ title, image, content, locale }) => {
  const ckContent = content.ckeditor_content

  return (
    // @ts-expect-error TS(2709): Cannot use namespace 'Container' as a type.
    <Container>
      // @ts-expect-error TS(2552): Cannot find name 'section'. Did you mean 'Selectio... Remove this comment to see the full error message
      <section className="text-gray-600 body-font py-24">
        // @ts-expect-error TS(2304): Cannot find name 'div'.
        <div className="container px-5 py-2 mx-auto flex flex-col justify-center items-center">
          // @ts-expect-error TS(2304): Cannot find name 'h1'.
          <h1 className="font-black sm:text-5xl text-4xl  mb-4 text-gray-900 text-center">
            {title}
          </h1>

          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="lg:w-4/6 mx-auto mt-10">
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="shadow-lg rounded-lg overflow-hidden">
              // @ts-expect-error TS(2304): Cannot find name 'img'.
              <img
                // @ts-expect-error TS(2304): Cannot find name 'alt'.
                alt={image.data.attributes.alternativeText}
                // @ts-expect-error TS(2304): Cannot find name 'className'.
                className="object-cover object-center h-full w-full"
                // @ts-expect-error TS(2304): Cannot find name 'src'.
                src={getStrapiMedia(image.data.attributes.url)}
              />
            </div>
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className="flex flex-col sm:flex-row mt-10 items-center justify-center"></div>
          </div>
          // @ts-expect-error TS(2304): Cannot find name 'div'.
          <div className="markdown-body ck-content shadow-lg rounded-xl lg:w-4/6 w-full md:p-12 p-6 mt-2 bg-white">
            // @ts-expect-error TS(2304): Cannot find name 'div'.
            <div className={styles['ck-no-border']}>
              // @ts-expect-error TS(2709): Cannot use namespace 'Container' as a type.
              <Container>{ckContent}</Container>
            </div>
          </div>
          // @ts-expect-error TS(2304): Cannot find name 'href'.
          <Link href={`/blog?lang=${locale}`}>
            // @ts-expect-error TS(2304): Cannot find name 'button'.
            <button
              // @ts-expect-error TS(2304): Cannot find name 'type'.
              type="button"
              // @ts-expect-error TS(2304): Cannot find name 'className'.
              className="ml-2 py-4 mt-8 px-6 bg-secondary hover:bg-secondary-darker text-white w-1/8 text-center text-base font-semibold shadow-sm rounded-md">
              // @ts-expect-error TS(2304): Cannot find name 'Back'.
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
