Reactatron = require 'Reactatron'
Columns = require './Columns'
Button = require './Button'
Spacer = require './Spacer'
LogoutButton = require './LogoutButton'
formatBytes = require '../formatBytes'

{div, span} = Reactatron.DOM

module.exports = Reactatron.component 'Navbar',

  propTypes:
    accountInfo:    Reactatron.PropTypes.object
    searchValue:    Reactatron.PropTypes.string.isRequired
    onSearchChange: Reactatron.PropTypes.func.isRequired

  render: ->
    Columns className: 'Navbar',
      PageButton page: 'Transfers'
      PageButton page: 'Files'
      SearchForm
        value: @props.searchValue
        onChange: @props.onSearchChange
      AccountInfo(@props.accountInfo)
      LogoutButton tabIndex: '-1', 'Logout'


PageButton = Reactatron.component 'Navbar-PageButton',
  onClick: ->
    @emit 'changePage', page: @props.page
  render: ->
    Button onClick: @onClick, @props.page

AccountInfo = Reactatron.component 'Navbar-AccountInfo',

  renderContainer: (children...) ->
    div className: 'Navbar-AccountInfo', children...

  render: ->

    if !this.props.avatar_url
      @renderContainer div(null, 'Loading...')
    else
      @renderContainer(
        DiskSize(size: @props.disk.used)
        ' / '
        DiskSize(size: @props.disk.size)
      )

DiskSize = Reactatron.component 'Navbar-DiskSize',
  render: ->
    span {}, formatBytes(@props.size, 2)


{form, input} = Reactatron.DOM

SearchForm = Reactatron.component 'Navbar-SearchForm',

  inputDOMNode: ->
    @DOMNode().querySelector('input')

  # componentDidMount: ->
  #   @inputDOMNode().focus()

  onSubmit: (event) ->
    event.preventDefault()
    @emit 'search', query: @refs.input.value

  onChange: (event) ->
    @props.onChange(@refs.input.value)

  render: ->
    console.log('SearchForm', @props)
    form
      onSubmit: @onSubmit
      className: 'Navbar-SearchForm grow shrink'
      input
        ref: 'input'
        type: 'text'
        placeholder: 'Search…'
        value: @props.value
        onChange: @onChange


