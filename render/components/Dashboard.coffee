component = require '../Reactatron/component'


{div, h1} = React.DOM

module.exports = component 'Dashboard',

  render: ->
    div className: 'Dashboard',
      h1(null, 'Torflix')
      AccountInfo(this.props.accountInfo)
      Transfers(this.props.transfers)

AccountInfo = component 'AccountInfo',

  render: ->

    if !this.props.avatar_url
      return div(null, 'Loading...')

    div className: 'Dashboard-AccountInfo',
      div(null, this.props.username)
      div
        this.props.disk.used
        ' / '
        this.props.disk.size


Transfers = component 'Transfers',

  render: ->
    div className: 'Dashboard-Transfers',
      div null, Transfers
      div null, JSON.stringify(this.props)
