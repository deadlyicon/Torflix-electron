Reactatron = require 'Reactatron'
Layout = require './Layout'
TransfersList = require './TransfersList'
Button = require './Button'

{div, input} = Reactatron.DOM


module.exports = Reactatron.component 'TransfersPage',

  # mixins: [Events]

  propTypes:
    transfers:         Reactatron.PropTypes.array
    focusedTransfer:   Reactatron.PropTypes.number
    selectedTransfers: Reactatron.PropTypes.array

  getInitialState: ->
    filter: ''

  onFilterChange: (filter) ->
    @setState filter: filter

  render: ->
    Layout @props,
      TransfersListControls
        selectedTransfers: @props.selectedTransfers
        filter: @state.filter
        onFilterChange: @onFilterChange

      TransfersList
        className: 'grow shrink overflow-y'
        transfers: @props.transfers
        filter: @state.filter
        selectedTransfers: @props.selectedTransfers


TransfersListControls = Reactatron.component 'TransfersList-Controls',

  propTypes:
    selectedTransfers: Reactatron.PropTypes.array.isRequired
    filter:            Reactatron.PropTypes.string.isRequired
    onFilterChange:    Reactatron.PropTypes.func.isRequired

  render: ->
    emit = (event) =>
      => @emit "transfers:#{event}"
    div className: 'TransfersList-Controls columns',
      Button onClick: emit('selectAll'), 'all'
      Button onClick: emit('clearSelection'), 'clear'
      # div className: 'spacer'
      FilterInput
        value: @props.filter
        onChange: @props.onFilterChange
        className: 'spacer'
      Button onClick: emit('downloadSelection'), 'download'
      Button onClick: emit('deleteSelection'), 'delete'



FilterInput = Reactatron.component 'FilterInput',

  propTypes:
    value:    Reactatron.PropTypes.string.isRequired
    onChange: Reactatron.PropTypes.func.isRequired

  onChange: (event) ->
    @props.onChange(@refs.input.value)

  onKeyDown: (event) ->
    # console.log(event.keyCode)
    if event.keyCode == 27
      @props.onChange('')


  render: ->
    input
      ref: 'input'
      className: 'FilterInput '+(@props.className||'')
      type: 'text'
      value: @props.value
      onChange: @onChange
      onKeyDown: @onKeyDown


