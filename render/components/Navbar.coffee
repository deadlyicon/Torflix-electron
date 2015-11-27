Reactatron = require 'Reactatron'
Columns = require './Columns'
Spacer = require './Spacer'
LogoutButton = require './LogoutButton'
formatBytes = require '../formatBytes'

{div, button, span} = Reactatron.DOM

module.exports = Reactatron.component 'Navbar',

  propTypes:
    accountInfo: Reactatron.PropTypes.object

  render: ->
    Columns className: 'Navbar',
      button onClick: @props.onPageChange.bind(null, 'Transfers'), 'Transfers'
      button onClick: @props.onPageChange.bind(null, 'Files'),     'Files'
      button onClick: @props.onPageChange.bind(null, 'Search'),    'Search'
      Spacer()
      AccountInfo(@props.accountInfo)
      LogoutButton null, 'Logout'




AccountInfo = Reactatron.component 'Navbar-AccountInfo',

  render: ->

    if !this.props.avatar_url
      return div(null, 'Loading...')

    div className: 'Navbar-AccountInfo',
      DiskSize(size: @props.disk.used)
      ' / '
      DiskSize(size: @props.disk.size)

DiskSize = Reactatron.component 'Navbar-DiskSize',

  render: ->
    span {}, formatBytes(@props.size, 2)
