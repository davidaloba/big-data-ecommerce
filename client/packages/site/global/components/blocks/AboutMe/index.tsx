import Bio from './bio'
import Stack from './stack'
import Widgets from './widgets'

export default function AboutMe({ bio, stack, widgets }) {
  console.log(bio, stack, widgets)

  return (
    <section className="grid grid-cols-1 md:grid-cols-3 gap-y-20 gap-x-20 bg-white ">
      <article className="mx-4 col-span-1 md:col-span-2">
        <Bio {...bio} />
        <Stack {...stack} />
      </article>
      <aside className="py-20">
        <Widgets widgets={widgets} />
      </aside>
    </section>
  )
}
