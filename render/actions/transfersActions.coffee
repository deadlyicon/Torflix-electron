module.exports = (App) ->

  App.state.transfers = JSON.parse(localStorage.transfers||null)

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


