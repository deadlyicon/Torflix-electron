require 'shouldhave/Array#includes'
require 'shouldhave/Array#remove'

Reactatron = require 'Reactatron'
formatBytes = require '../formatBytes'
Checkbox = require './Checkbox'
Link = require './Link'

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
          selected: @props.selectedTransfers.includes(transfer.id)

Transfer = Reactatron.component 'TransfersList-Transfer',

  propTypes:
    transfer: Reactatron.PropTypes.object.isRequired
    selected: Reactatron.PropTypes.bool.isRequired

  onClick: (event) ->
    event.preventDefault()
    return if @props.transfer.deleting
    if event.metaKey
      @emit 'transfers:toggleSelection', @props.transfer
    else if event.shiftKey
      # TODO select group
    else if @props.selected
      return
    else
      @emit 'transfers:selectSingleTransfer', @props.transfer



  render: ->
    transfer = @props.transfer
    className = 'TransfersList-Transfer columns'
    if transfer.deleting
      className = className+' TransfersList-Transfer-deleting'
    else if @props.selected
      className = className+' TransfersList-Transfer-selected'

    if transfer.file_id
      downloadButton = DownloadTransferButton transfer: transfer

    div className: className, onClick: @onClick,
      div className: 'rows grow shrink padding-1',
        div className: 'columns ',
          div null, transfer.name
          div className: 'spacer'
          div null, formatBytes(transfer.size)
          downloadButton
        div null,
          progress max: 100, value: transfer.percent_done||0
        div null,
          transfer.status_message


DownloadTransferButton = Reactatron.component 'DownloadTransferButton',

  propTypes:
    transfer: Reactatron.PropTypes.object.isRequired

  download: (event) ->
    event.stopPropagation()
    event.preventDefault()
    @emit 'transfers:download', @props.transfer
    @props.onClick?()

  render: ->
    props = Object.clone(@props)
    props.onClick = @download
    Link props, 'download'
