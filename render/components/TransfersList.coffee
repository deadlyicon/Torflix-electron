Reactatron = require 'Reactatron'
formatBytes = require '../formatBytes'
Checkbox = require './Checkbox'

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
      if !this.props.transfers
        div(null, 'Loading...')
      else
        @props.transfers.map (transfer) =>
          Transfer
            key: transfer.id
            transfer: transfer
            selected: @isSelected(transfer)
            toggleSelection: @toggleSelection


Transfer = Reactatron.component 'TransfersList-Transfer',

  propTypes:
    transfer: Reactatron.PropTypes.object.isRequired
    selected: Reactatron.PropTypes.bool.isRequired
    toggleSelection: Reactatron.PropTypes.func.isRequired

  toggleSelection: ->
    @props.toggleSelection(@props.transfer)

  onKeyDown: (event) ->
    # console.log(event.keyCode)
    preventDefault = true
    switch event.keyCode
      when 40 # down
        @DOMNode().nextElementSibling?.focus()
      when 38 # up
        @DOMNode().previousElementSibling?.focus()
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

