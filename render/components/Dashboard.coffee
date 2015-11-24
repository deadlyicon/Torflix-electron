Reactatron = require '../../Reactatron'

{div, h1} = Reactatron.DOM

module.exports = Reactatron.component 'Dashboard',

  render: ->
    div className: 'Dashboard',
      h1(null, 'Torflix')
      AccountInfo(this.props.accountInfo)
      Transfers(this.props.transfers)

AccountInfo = Reactatron.component 'AccountInfo',

  render: ->

    if !this.props.avatar_url
      return div(null, 'Loading...')

    div className: 'Dashboard-AccountInfo',
      div(null, this.props.username)
      div
        this.props.disk.used
        ' / '
        this.props.disk.size


Transfers = Reactatron.component 'Transfers',

  render: ->
    div className: 'Dashboard-Transfers',
      div null, Transfers
      div null, JSON.stringify(this.props)
