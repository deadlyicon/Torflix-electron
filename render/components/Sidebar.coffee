Reactatron = require 'Reactatron'
Columns = require './Columns'
Button = require './Button'
Spacer = require './Spacer'
LogoutButton = require './LogoutButton'
formatBytes = require '../formatBytes'

{div, span} = Reactatron.DOM

module.exports = Reactatron.component 'Sidebar',

  propTypes:
    accountInfo: Reactatron.PropTypes.object

  render: ->
    div className: 'Sidebar rows',
      PageButton page: 'Transfers'
      PageButton page: 'Files'
      div className: 'grow shrink'
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

