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


module.exports = Reactatron.component 'TransfersPage',

  # mixins: [Events]

  propTypes:
    transfers:         Reactatron.PropTypes.array
    focusedTransfer:   Reactatron.PropTypes.number
    selectedTransfers: Reactatron.PropTypes.array

  getInitialState: ->
    filter: null

  filterList: (filter) ->
    @setState filter: filter

  filterTransfers: ->
    # return @props.transfers
    filter = @state.filter
    return @props.transfers unless filter
    filter = filter.toLowerCase()
    @props.transfers.filter (transfer) ->
      transfer.name.toLowerCase().includes(filter)

  render: ->
    div className: 'TransfersList layer rows', # onKeyUp: @onKeyUp,
      @renderControls()
      div className: 'grow shrink overflow-y',
        TransfersList
          transfers: @filterTransfers()
          selectedTransfers: @props.selectedTransfers

  renderControls: ->
    if @props.selectedTransfers.length == 0
      console.log('xxx', @state.filter)
      return Navbar
        accountInfo: @props.accountInfo
        searchValue: @state.filter||''
        onSearchChange: @filterList

    if @state.finding
      return div(null, 'finding...')

    Controls
      transfers: @props.transfers
      selectedTransfers: @props.selectedTransfers
      # selectAll: @selectAll
      # clearSelection: @clearSelection





Controls = Reactatron.component 'TransfersList-Controls',
  propTypes:
    selectedTransfers: Reactatron.PropTypes.array.isRequired

  render: ->
    emit = (event) =>
      => @emit "transfers:#{event}"
    div className: 'TransfersList-Controls columns',
      Button onClick: emit('selectAll'), 'all'
      Button onClick: emit('clearSelection'), 'clear'
      div className: 'grow flex'
      Button onClick: emit('downloadSelection'), 'download'
      Button onClick: emit('deleteSelection'), 'delete'



