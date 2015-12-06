require 'shouldhave/Array#includes'
require 'shouldhave/Array#remove'

Reactatron = require 'Reactatron'
formatBytes = require '../formatBytes'
Checkbox = require './Checkbox'

{div, progress} = Reactatron.DOM

module.exports = Reactatron.component 'TransfersList',

  propTypes:
    transfers:         Reactatron.PropTypes.array.isRequired
    selectedTransfers: Reactatron.PropTypes.array.isRequired
    filter:            Reactatron.PropTypes.string

  filteredTransfers: ->
    filter = @props.filter
    return @props.transfers unless filter
    filter = filter.toLowerCase()
    @props.transfers.filter (transfer) ->
      transfer.name.toLowerCase().includes(filter)

  render: ->
    className = 'TransfersList '+(@props.className||'')
    div className: className,
      @filteredTransfers().map (transfer) =>
        Transfer
          key: transfer.id
          transfer: transfer
          selectedTransfers: @props.selectedTransfers

Transfer = Reactatron.component 'TransfersList-Transfer',

  propTypes:
    transfer: Reactatron.PropTypes.object.isRequired
    selectedTransfers: Reactatron.PropTypes.array.isRequired

  toggleSelection: ->
    @emit 'transfers:toggleSelection', @props.transfer

  render: ->
    transfer = @props.transfer
    selected = @props.selectedTransfers.includes(transfer.id)
    className = 'TransfersList-Transfer columns'
    if selected
      className = className+' TransfersList-Transfer-selected'

    div className: className, tabIndex:'0', onKeyDown: @onKeyDown,
      div className: 'padding-1',
        Checkbox
          tabIndex: '-1'
          checked: selected
          onChange: @toggleSelection
      div className: 'rows grow shrink padding-1',
        div null,
          transfer.name
          formatBytes(transfer.size)
        div null,
          progress max: 100, value: transfer.percent_done||0
        div null,
          transfer.status_message

