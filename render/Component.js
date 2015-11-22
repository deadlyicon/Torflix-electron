export function Component(displayName, spec) {
  spec.displayName = displayName
  return React.createFactory(React.createClass(spec))
}
