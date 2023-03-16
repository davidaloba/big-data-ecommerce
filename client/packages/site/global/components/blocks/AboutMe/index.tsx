import Bio from './bio'
import Stack from './stack'
import Widgets from './widgets'

export default function AboutMe({ bio, stack, widgets }) {
  return (
    <section className="grid grid-cols-1 lg:grid-cols-3 gap-y-8 xl:gap-x-20 bg-white ">
      <article className="py-8  col-span-1 md:col-span-2">
        <Bio {...bio} />
        <Stack {...stack} />
      </article>
      <aside className="py-8 px-4 ">
        <Widgets widgets={widgets} />
      </aside>
    </section>
  )
}
