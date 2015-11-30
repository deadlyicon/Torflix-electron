require 'shouldhave/Array#includes'
require 'shouldhave/Array#remove'

Reactatron = require 'Reactatron'
formatBytes = require '../formatBytes'
Navbar = require './Navbar'
Checkbox = require './Checkbox'
Button = require './Button'
Link = require './Link'

{div, progress} = Reactatron.DOM

module.exports = Reactatron.component 'TransfersList',

  propTypes:
    transfers: Reactatron.PropTypes.array

  getInitialState: ->
    selectedTransfers: []

  toggleSelection: (transfer) ->
    selectedTransfers = @state.selectedTransfers
    if selectedTransfers.includes(transfer.id)
      selectedTransfers.remove(transfer.id)
    else
      selectedTransfers.push(transfer.id)
    @setState selectedTransfers: selectedTransfers

  isSelected: (transfer) ->
    @state.selectedTransfers.includes(transfer.id)

  clearSelection: ->
    @setState selectedTransfers: []

  selectAll: ->
    ids = @props.transfers.map (t) -> t.id
    @setState selectedTransfers: ids

  render: ->
    div className: 'TransfersList rows',
      @renderControls()
      @renderTransfers()

  renderControls: ->
    if @state.selectedTransfers.length == 0
      Navbar accountInfo: @props.accountInfo
    else
      Controls
        transfers: @props.transfers
        selectedTransfers: @state.selectedTransfers
        selectAll: @selectAll
        clearSelection: @clearSelection

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
    selectedTransfers: Reactatron.PropTypes.array.isRequired
    selectAll: Reactatron.PropTypes.func.isRequired
    clearSelection: Reactatron.PropTypes.func.isRequired

  render: ->
    div className: 'TransfersList-Controls columns',
      Button onClick: @props.selectAll, 'all'
      Button onClick: @props.clearSelection, 'clear'
      div className: 'grow flex'
      Button onClick: null, 'download'
      Button onClick: null, 'delete'

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

