Putio = require('Putio')

module.exports = (App) ->

  putio = new Putio
  putio.token = App.state.putioToken

  App.loginURI = ->
    putio.generateLoginURI()

  setToken = (token) ->
    return if App.state.token == token
    putio.token = token
    localStorage.putioToken = token
    App.setState putioToken: token

  loadAccountInfo = ->
    accountInfo = App.state.accountInfo
    if !accountInfo? || accountInfo.token != putio.token
      reloadAccountInfo()

  reloadAccountInfo = ->
    token = putio.token # at request time
    putio.accountInfo().then (accountInfo) ->
      accountInfo.token = token
      App.setState accountInfo: accountInfo

  loadTransfers = ->
    App.state.transfers or reloadTransfers()

  reloadTransfers = ->
    putio.transfers().then (transfers) ->
      App.setState transfers: transfers

  loadFiles = ->
    App.state.files or reloadFiles()

  reloadFiles = ->
    # putio.allFiles().then (files) ->
    putio.directoryContents(0).then ({files}) ->
      App.setState files: files

  loadStuff = ->
    loadAccountInfo()
    loadTransfers()
    loadFiles()

  App.on 'start', ->
    loadStuff() if App.state.putioToken

  App.on 'login', (payload) ->
    setToken(payload.token)
    loadStuff()

  App.on 'logout', ->
    # throw away token
    # kill cookies

  App.on 'reloadFiles', reloadFiles

  App.on 'reloadTransfers', reloadTransfers
