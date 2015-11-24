require 'shouldhave/Object.bindAll'

React = require 'react'
ReactDOM = require 'react-dom'
Events = require './Events'
component = require './component'

module.exports = class ReactatronApp

  constructor: ->
    Object.bindAll(this)
    @state = {}
    @events = new Events
    @on = this.events.on.bind(this.events)

  emit: (event, payload) ->
    console.info('emit', event, payload)
    @events.emit(event, payload)
    return @

  start: ->
    instance = PageComponent
      state:  @state
      emit:   @emit
      render: @render

    @component = ReactDOM.render(instance, @element)
    return @

  setState: (update) ->
    console.info('App.setState', update)
    Object.assign(this.state, update)
    # TODO we may want to implement a delay here
    @component?.setState(@state)
    return @;


PageComponent = React.createFactory React.createClass
  displayName: 'PageComponent'

  childContextTypes:
    emit: React.PropTypes.func

  getChildContext: ->
    emit: @props.emit

  render: ->
    @props.render()


