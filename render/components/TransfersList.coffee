Reactatron = require 'Reactatron'
formatBytes = require '../formatBytes'
Checkbox = require './Checkbox'
Button = require './Button'
Link = require './Link'

{div, progress} = Reactatron.DOM

module.exports = Reactatron.component 'TransfersList',

  propTypes:
    transfers: Reactatron.PropTypes.array

  getInitialState: ->
    selectedTransfers: {}

  toggleSelection: (transfer) ->
    selectedTransfers = @state.selectedTransfers
    selectedTransfers[transfer.id] = !selectedTransfers[transfer.id]
    @setState selectedTransfers: selectedTransfers

  isSelected: (transfer) ->
    !!@state.selectedTransfers[transfer.id]

  render: ->
    div className: 'TransfersList rows',
      Controls
        transfers: @props.transfers
        selectedTransfers: @state.selectedTransfers
      @renderTransfers()

  renderTransfers: ->
    return div(null, 'Loading...') if !this.props.transfers
    @props.transfers.map (transfer) =>
      Transfer
        key: transfer.id
        transfer: transfer
        selected: @isSelected(transfer)
        toggleSelection: @toggleSelection


Controls = Reactatron.component 'TransfersList-Controls',
  propTypes:
    selectedTransfers: Reactatron.PropTypes.object.isRequired
  render: ->
    div className: 'TransfersList-Controls columns',
      Link onClick: null, 'all'
      div className: 'grow flex'
      Link onClick: null, 'delete'

Transfer = Reactatron.component 'TransfersList-Transfer',

  propTypes:
    transfer: Reactatron.PropTypes.object.isRequired
    selected: Reactatron.PropTypes.bool.isRequired
    toggleSelection: Reactatron.PropTypes.func.isRequired

  toggleSelection: ->
    @props.toggleSelection(@props.transfer)

  focusNextTransfer: ->
    @DOMNode().nextElementSibling?.focus()

  focusPreviousTransfer: ->
    @DOMNode().previousElementSibling?.focus()

  onKeyDown: (event) ->
    preventDefault = true
    switch event.keyCode
      when 38 # up
        @focusPreviousTransfer()
      when 40 # down
        @focusNextTransfer()
      when 74 # j
        @focusNextTransfer()
      when 75 # k
        @focusPreviousTransfer()
      when 88 # x
        @toggleSelection()
      else
        preventDefault = false
    event.preventDefault() if preventDefault

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

