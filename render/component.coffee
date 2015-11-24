React = require 'react'
component = require './Reactatron/component'

module.exports = createAppComponent = (displayName, spec) ->
  spec.mixins ||= []
  spec.mixins.unshift(AppMixin)
  component(displayName, spec)

AppMixin =
  contextTypes:
    emit: React.PropTypes.func

  emit: (args...) ->
    @context.emit(args...)
