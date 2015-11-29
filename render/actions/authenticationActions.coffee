module.exports = (App) ->

  App.state.accountInfo = JSON.parse(localStorage.accountInfo||null)

  Putio = require('Putio')

  App.putio = new Putio
  App.setPutioToken = (token) ->
    App.state.putioToken = token
    App.putio.token = token

  App.setPutioToken(localStorage.putioToken)

  App.loadAccountInfo = ->
    accountInfo = App.state.accountInfo
    if !accountInfo? || accountInfo.token != App.putio.token
      App.reloadAccountInfo()

  App.reloadAccountInfo = ->
    token = putio.token # at request time
    App.putio.accountInfo().then (accountInfo) ->
      accountInfo.token = token
      localStorage.accountInfo = JSON.stringify(accountInfo)
      App.setState accountInfo: accountInfo

  App.on 'login', ({token}) ->
    App.setPutioToken(token)
    App.loadAccountInfo()

  App.on 'logout', ->
    # throw away token
    # kill cookies



  App.on 'addTransfer', ({magnetLink}) ->
    App.putio.addTransfer(magnetLink)






