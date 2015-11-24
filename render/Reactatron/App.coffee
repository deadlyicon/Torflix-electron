Events = require './Events'
component = require './component'

module.exports = class ReactatronApp

  constructor: ->
    @state = {}
    @events = new Events
    @on = this.events.on.bind(this.events)
    # Object.bindAll(this)

  emit: (event, payload) ->
    console.info('emit', event, payload)
    @events.emit(event, payload)
    return @

  start : ->
    props =
      state:  @state
      emit:   @emit.bind(this)
      render: @render.bind(this)

    instance = React.createElement(PageComponent, props)
    @component = ReactDOM.render(instance, @element)
    return @

  setState: (update) ->
    console.info('App.setState', update)
    Object.assign(this.state, update)
    # TODO we may want to implement a delay here
    @component?.setState(@state)
    return @;


PageComponent = component 'PageComponent',

  childContextTypes:
    emit: React.PropTypes.func

  getChildContext: ->
    emit: this.props.emit

  render: ->
    this.props.render()


