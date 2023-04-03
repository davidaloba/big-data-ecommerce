export interface Repeatable {
  Element: (props) => JSX.Element
  elements: Array<any>
  pre: string
  style?: { [index: string]: string }
  children?: JSX.Element
}

const Repeatable = ({ Element, elements, pre, style, children }: Repeatable) => {
  return (
    <ul className={style && style.container}>
      {children}
      {elements.map((element: object, index) => (
        <li
          key={`${pre}-${index}`}
          className={style && style.wrapper}>
          <Element
            element={element}
            {...element}
            index={index}></Element>
        </li>
      ))}
    </ul>
  )
}

export default Repeatable
