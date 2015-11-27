Reactatron = require 'Reactatron'
formatBytes = require '../formatBytes'

{div} = Reactatron.DOM

module.exports = Reactatron.component 'TransfersList',

  propTypes:
    transfers: Reactatron.PropTypes.array

  render: ->
    if !this.props.transfers
      return div(null, 'Loading...')

    div className: 'TransfersList',
      @props.transfers.map (transfer) ->
        Transfer(Object.assign({key: transfer.id}, transfer))


Transfer = Reactatron.component 'TransfersList-Transfer',

  propTypes:
    name: Reactatron.PropTypes.string.isRequired
    size: Reactatron.PropTypes.number.isRequired

  render: ->
    div className: 'TransfersList-Transfer',
      div null, @props.name
      div null, formatBytes(@props.size)