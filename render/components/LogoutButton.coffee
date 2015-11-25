Reactatron = require '../../Reactatron'
Button = require './Button'

module.exports = Reactatron.component 'LogoutButton',

  onClick: ->
    @emit 'logout'

  render: ->
    props = @cloneProps()
    props.onClick = @onClick
    Button(props)
