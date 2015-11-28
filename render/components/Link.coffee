Reactatron = require 'Reactatron'

module.exports = Reactatron.component 'Button',

  onClick: (event) ->
    event.preventDefault()
    @props.onClick?(event)

  render: ->
    props = @cloneProps()
    props.href ||= ''
    props.onClick = @onClick
    Reactatron.createElement('a', props)
