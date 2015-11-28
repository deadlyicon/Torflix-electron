require 'shouldhave/Object.clone'
React = require 'react'
ReactDOM = require 'react-dom'

module.exports = createReactatronComponent = (displayName, spec) ->
  spec.displayName = displayName
  spec.mixins ||= []
  spec.mixins.unshift(AppMixin)
  reactClass = React.createClass(spec)
  reactFactory = React.createFactory(reactClass)


AppMixin =
  contextTypes:
    emit: React.PropTypes.func.isRequired

  emit: (args...) ->
    @context.emit(args...)

  cloneProps: ->
    Object.clone(@props)

  DOMNode: ->
    ReactDOM.findDOMNode(this)
