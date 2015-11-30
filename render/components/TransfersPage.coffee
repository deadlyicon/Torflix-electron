require 'shouldhave/Array#includes'
require 'shouldhave/Array#remove'

Reactatron = require 'Reactatron'
formatBytes = require '../formatBytes'
Navbar = require './Navbar'
TransfersList = require './TransfersList'
Checkbox = require './Checkbox'
Button = require './Button'
Link = require './Link'

{div} = Reactatron.DOM


HasTransfersSelection =

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

  isSelected: (transfer) ->
    @state.selectedTransfers.includes(transfer.id)

  focusNextTransfer: (element) ->
    element.nextElementSibling?.focus()

  focusPreviousTransfer: (element) ->
    element.previousElementSibling?.focus()



module.exports = Reactatron.component 'TransfersPage',

  mixins: [HasTransfersSelection]

  propTypes:
    transfers: Reactatron.PropTypes.array

  onTransferKeyDown: (event, transfer) ->
    preventDefault = true
    switch event.keyCode
      when 38 # up
        @focusPreviousTransfer(event.target)
      when 40 # down
        @focusNextTransfer(event.target)
      when 74 # j
        @focusNextTransfer(event.target)
      when 75 # k
        @focusPreviousTransfer(event.target)
      when 88 # x
        @toggleSelection(transfer)
      else
        preventDefault = false
    event.preventDefault() if preventDefault

  render: ->
    div className: 'TransfersList layer rows',
      @renderControls()
      div className: 'grow shrink overflow-y',
        TransfersList
          transfers: @props.transfers
          isSelected: @isSelected
          toggleSelection: @toggleSelection
          onKeyDown: @onTransferKeyDown

  renderControls: ->
    if @state.selectedTransfers.length == 0
      Navbar accountInfo: @props.accountInfo
    else
      Controls
        transfers: @props.transfers
        selectedTransfers: @state.selectedTransfers
        selectAll: @selectAll
        clearSelection: @clearSelection





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



