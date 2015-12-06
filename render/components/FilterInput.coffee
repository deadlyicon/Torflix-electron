Reactatron = require 'Reactatron'

{input} = Reactatron.DOM

module.exports = Reactatron.component 'FilterInput',

  propTypes:
    value:    Reactatron.PropTypes.string.isRequired
    onChange: Reactatron.PropTypes.func.isRequired

  onChange: (event) ->
    @props.onChange(@refs.input.value)

  onKeyDown: (event) ->
    # console.log(event.keyCode)
    if event.keyCode == 27
      @props.onChange('')


  render: ->
    input
      ref: 'input'
      className: 'FilterInput '+(@props.className||'')
      placeholder: 'filter'
      # className: Classnames('FilterInput', @props.className)
      type: 'text'
      value: @props.value
      onChange: @onChange
      onKeyDown: @onKeyDown


