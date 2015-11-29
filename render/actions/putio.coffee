# Putio = require('Putio')

# module.exports = (App) ->

#   App.state.putioToken  = localStorage.putioToken
#   App.state.accountInfo = JSON.parse(localStorage.accountInfo||null)
#   App.state.transfers   = JSON.parse(localStorage.transfers||null)
#   App.state.files       = JSON.parse(localStorage.files||null)

#   putio = new Putio
#   putio.token = App.state.putioToken

#   App.loginURI = ->
#     putio.generateLoginURI()

#   App.putio =
#     setToken: (token) ->
#       return if App.state.token == token
#       putio.token = token
#       localStorage.putioToken = token
#       App.setState putioToken: token

#     loadStuff: ->
#       @loadAccountInfo()
#       @loadTransfers()
#       @loadFiles()

#   App.on 'start', ->
#     App.putio.loadStuff() if App.state.putioToken

#   App.on 'login', (payload) ->
#     App.putio.setToken(payload.token)
#     App.putio.loadStuff()

#   App.on 'logout', ->
#     # throw away token
#     # kill cookies

#   App.on 'reloadFiles', App.putio.reloadFiles

#   App.on 'reloadTransfers', App.putio.reloadTransfers




