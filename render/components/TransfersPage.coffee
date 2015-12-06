Reactatron = require 'Reactatron'
Layout = require './Layout'
TransfersList = require './TransfersList'
Button = require './Button'

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

  render: ->
    Layout @props,
      TransfersListControls null
      TransfersList
        className: 'grow shrink overflow-y'
        transfers: @props.transfers
        filter: @state.filter
        selectedTransfers: @props.selectedTransfers

    # div className: 'TransfersList layer rows', # onKeyUp: @onKeyUp,
    #   @renderControls()
    #   div className: 'grow shrink overflow-y',
    #     TransfersList
    #       transfers: @props.transfers
    #       filter: @state.filter
    #       selectedTransfers: @props.selectedTransfers

#   renderControls: ->
#     if @props.selectedTransfers.length == 0
#       console.log('xxx', @state.filter)
#       return Navbar
#         accountInfo: @props.accountInfo
#         searchValue: @state.filter||''
#         onSearchChange: @filterList

#     if @state.finding
#       return div(null, 'finding...')

#     Controls
#       transfers: @props.transfers
#       selectedTransfers: @props.selectedTransfers
#       # selectAll: @selectAll
#       # clearSelection: @clearSelection





TransfersListControls = Reactatron.component 'TransfersList-Controls',

  render: ->
    emit = (event) =>
      => @emit "transfers:#{event}"
    div className: 'TransfersList-Controls columns',
      Button onClick: emit('selectAll'), 'all'
      Button onClick: emit('clearSelection'), 'clear'
      div className: 'spacer'
      Button onClick: emit('downloadSelection'), 'download'
      Button onClick: emit('deleteSelection'), 'delete'



