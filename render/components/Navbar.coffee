Reactatron = require 'Reactatron'
Columns = require './Columns'
Button = require './Button'
Spacer = require './Spacer'
LogoutButton = require './LogoutButton'
formatBytes = require '../formatBytes'

{div, span} = Reactatron.DOM

module.exports = Reactatron.component 'Navbar',

  propTypes:
    accountInfo: Reactatron.PropTypes.object

  toggleSidebar: ->


  render: ->
    Columns className: 'Navbar',
      Button onClick: @toggleSidebar, 'X'
      SearchForm()




{form, input} = Reactatron.DOM

SearchForm = Reactatron.component 'Navbar-SearchForm',

  inputDOMNode: ->
    @DOMNode().querySelector('input')

  # componentDidMount: ->
  #   @inputDOMNode().focus()

  onSubmit: (event) ->
    event.preventDefault()
    @emit 'search', query: @inputDOMNode().value

  render: ->
    form
      onSubmit: @onSubmit
      className: 'Navbar-SearchForm grow shrink'
      input
        type: 'text'
        placeholder: 'Search…'


