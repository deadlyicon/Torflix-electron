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

  render: ->
    Columns className: 'Navbar',
      Button onClick: @props.onPageChange.bind(null, 'Transfers'), 'Transfers'
      Button onClick: @props.onPageChange.bind(null, 'Files'),     'Files'
      Button onClick: @props.onPageChange.bind(null, 'Search'),    'Search'
      Spacer()
      AccountInfo(@props.accountInfo)
      LogoutButton null, 'Logout'




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
