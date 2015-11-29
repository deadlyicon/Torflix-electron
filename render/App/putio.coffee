# putio = new Putio
# putio.token = App.state.putioToken

# App.loginURI = ->
#   putio.generateLoginURI()

# App.putio =
#   putio: -> new Putio(App.state.putioToken)

#   setToken: (token) ->
#     return if App.state.token == token
#     putio.token = token
#     localStorage.putioToken = token
#     App.setState putioToken: token

#   loadAccountInfo: ->
#     accountInfo = App.state.accountInfo
#     if !accountInfo? || accountInfo.token != putio.token
#       @reloadAccountInfo()

#   reloadAccountInfo: ->
#     token = putio.token # at request time
#     putio.accountInfo().then (accountInfo) ->
#       accountInfo.token = token
#       localStorage.accountInfo = JSON.stringify(accountInfo)
#       App.setState accountInfo: accountInfo

#   loadTransfers: ->
#     App.state.transfers or @reloadTransfers()

#   reloadTransfers: ->
#     putio.transfers().then (transfers) ->
#       localStorage.transfers = JSON.stringify(transfers)
#       App.setState transfers: transfers

#   loadFiles: ->
#     App.state.files or @reloadFiles()

#   reloadFiles: ->
#     # putio.allFiles().then (files) ->
#     putio.directoryContents(0).then ({files}) ->
#       localStorage.files = JSON.stringify(files)
#       App.setState files: files

#   addTransfer: (magnetLink) ->
#     putio.addTransfer(magnetLink)

#   loadStuff: ->
#     @loadAccountInfo()
#     @loadTransfers()
#     @loadFiles()
