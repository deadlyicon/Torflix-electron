module.exports = (displayName, spec) => {
  spec.displayName = displayName
  return React.createFactory(React.createClass(spec))
}
