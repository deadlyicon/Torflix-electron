module.exports = createReactatronComponent = (displayName, spec) ->
  spec.displayName = displayName
  reactClass = React.createClass(spec)
  reactFactory = React.createFactory(reactClass)
