require 'shouldhave/Array#includes'
require 'shouldhave/Array#remove'

Reactatron = require 'Reactatron'
formatBytes = require '../formatBytes'
Checkbox = require './Checkbox'

{div, progress} = Reactatron.DOM

module.exports = Reactatron.component 'TransfersList',

  propTypes:
    transfers:  Reactatron.PropTypes.array.isRequired
    isSelected: Reactatron.PropTypes.func.isRequired
    toggleSelection:   Reactatron.PropTypes.func.isRequired
    onKeyDown:   Reactatron.PropTypes.func

  render: ->
    div className: 'TransfersList', @renderTransfers()

  renderTransfers: ->
    return div(null, 'Loading...') if !this.props.transfers
    @props.transfers.map (transfer) =>
      Transfer
        key: transfer.id
        transfer: transfer
        selected: @props.isSelected(transfer)
        toggleSelection: @props.toggleSelection
        onKeyDown: @props.onKeyDown


Transfer = Reactatron.component 'TransfersList-Transfer',

  propTypes:
    transfer: Reactatron.PropTypes.object.isRequired
    selected: Reactatron.PropTypes.bool.isRequired
    toggleSelection: Reactatron.PropTypes.func.isRequired
    onKeyDown: Reactatron.PropTypes.func

  toggleSelection: ->
    @props.toggleSelection(@props.transfer)

  onKeyDown: (event) ->
    @props.onKeyDown(event, @props.transfer)

  render: ->
    transfer = @props.transfer
    className = 'TransfersList-Transfer columns'
    if @props.selected
      className = className+' TransfersList-Transfer-selected'

    div className: className, tabIndex:'0', onKeyDown: @onKeyDown,
      div className: 'padding-1',
        Checkbox
          tabIndex: '-1'
          checked: @props.selected
          onChange: @toggleSelection
      div className: 'rows grow shrink padding-1',
        div null,
          transfer.name
          formatBytes(transfer.size)
        div null,
          progress max: 100, value: transfer.percent_done||0
        div null,
          transfer.status_message

