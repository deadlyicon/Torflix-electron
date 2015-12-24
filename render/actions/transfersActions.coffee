module.exports = (App) ->

  App.state.transfers = JSON.parse(localStorage.transfers||null)
  App.state.focusedTransfer = null
  App.state.selectedTransfers = []

  App.loadTransfers = ->
    App.state.transfers or @reloadTransfers()

  App.reloadTransfers = ->
    App.putio.transfers().then (transfers) ->
      localStorage.transfers = JSON.stringify(transfers)
      App.setState transfers: transfers

  App.addTransfer = (magnetLink) ->
    App.putio.addTransfer(magnetLink).then (transfer) ->
      App.emit 'transferAdded', transfer

  App.on 'start', ->
    App.loadTransfers()

  App.on 'login', ->
    App.loadTransfers()

  App.on 'addTransfer', ({magnetLink}) ->
    App.putio.addTransfer(magnetLink)

  App.on 'reloadTransfers', ->
    App.reloadTransfers()

  App.on 'transfers:reload', ->
    App.reloadTransfers()

  App.on 'transfers:clearSelection', ->
    App.setState selectedTransfers: []

  App.on 'transfers:selectAll', ->
    ids = App.state.transfers.map (t) -> t.id
    App.setState selectedTransfers: ids

  App.on 'transfers:selectTransfer', (transfer) ->
    selectedTransfers = App.state.selectedTransfers || []
    selectedTransfers.push(transfer.id)
    App.setState selectedTransfers: selectedTransfers

  App.on 'transfers:selectSingleTransfer', (transfer) ->
    App.setState selectedTransfers: [transfer.id]

  App.on 'transfers:toggleSelection', (transfer) ->
    selectedTransfers = App.state.selectedTransfers
    if selectedTransfers.includes(transfer.id)
      selectedTransfers.remove(transfer.id)
    else
      selectedTransfers.push(transfer.id)
    App.setState selectedTransfers: selectedTransfers

  App.on 'transfers:deleteSelection', ->
    console.log('deleting', App.state.selectedTransfers)
    transferIds = App.state.selectedTransfers
    for transfer in App.state.transfers
      if transferIds.includes(transfer.id)
        transfer.deleting = true
    App.setState selectedTransfers: []


  App.on 'transfers:downloadSelection', ->
    console.log('downloading', App.state.selectedTransfers)

  App.on 'transfers:download', (transfer) ->
    App.emit 'files:download', transfer.file_id

