export interface Repeatable {
  Element: (props) => JSX.Element
  elements: Array<unknown>
  pre: string
  style?: { [index: string]: string }
  children?: JSX.Element
}

const Repeatable = ({ Element, elements, pre, style, children }: Repeatable) => {
  return (
    <ul className={style && style.container}>
      {children}
      {elements &&
        elements.map((element: object, index) => (
          <li
            key={`${pre}-${index}`}
            className={style && style.wrapper}>
            <Element
              element={element}
              {...element}
              index={index}
            />
          </li>
        ))}
    </ul>
  )
}

export default Repeatable
