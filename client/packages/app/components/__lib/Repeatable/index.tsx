export interface Repeatable {
  Element: (props) => JSX.Element
  elements: Array<unknown>
  pre: string
  style: { [index: string]: string }
  children?: JSX.Element
}

const Repeatable = ({ Element, elements, pre, style, children }: Repeatable) => {
  return (
    <ul className={style.container}>
      {children}
      {elements.map((element: object, index) => (
        <li
          key={`${pre}-${index}`}
          className={style.wrapper}>
          <Element
            {...element}
            index={index}></Element>
        </li>
      ))}
    </ul>
  )
}

export default Repeatable
