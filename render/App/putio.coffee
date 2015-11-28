Putio = require('Putio')

module.exports = (App) ->

  App.state.putioToken  = localStorage.putioToken
  App.state.accountInfo = JSON.parse(localStorage.accountInfo||null)
  App.state.transfers   = JSON.parse(localStorage.transfers||null)
  App.state.files       = JSON.parse(localStorage.files||null)

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
      localStorage.accountInfo = JSON.stringify(accountInfo)
      App.setState accountInfo: accountInfo

  loadTransfers = ->
    App.state.transfers or reloadTransfers()

  reloadTransfers = ->
    putio.transfers().then (transfers) ->
      localStorage.transfers = JSON.stringify(transfers)
      App.setState transfers: transfers

  loadFiles = ->
    App.state.files or reloadFiles()

  reloadFiles = ->
    # putio.allFiles().then (files) ->
    putio.directoryContents(0).then ({files}) ->
      localStorage.files = JSON.stringify(files)
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



