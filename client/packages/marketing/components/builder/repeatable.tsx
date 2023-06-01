export interface Repeatable {
  Element: (props) => JSX.Element
  elements: Array<any>
  pre: string
  style?: { [index: string]: string }
  children?: JSX.Element
}

const Repeatable = ({ Element, elements, pre, style, children }: Repeatable) => {
  return (
    <div className={style && style.container}>
      {children}
      {elements &&
        elements.map((element: object, index) => (
          <div
            key={`${pre}-${index}`}
            className={style && style.wrapper}>
            <Element
              element={element}
              {...element}
              index={index}
            />
          </div>
        ))}
    </div>
  )
}

export default Repeatable
