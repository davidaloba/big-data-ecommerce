const Container = ({ children }) => {
  // @ts-expect-error TS(2304): Cannot find name 'div'.
  return <div className="bg-white container mx-auto">{children}</div>
}

Container.defaultProps = {}

export default Container
