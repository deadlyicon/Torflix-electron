module.exports = (App) ->

  App.state.files = JSON.parse(localStorage.files||null)

  App.loadFiles = ->
    App.state.files or App.reloadFiles()

  App.reloadFiles = ->
    # @putio.allFiles().then (files) ->
    App.putio.directoryContents(0).then ({files}) ->
      localStorage.files = JSON.stringify(files)
      App.setState files: files

  App.on 'login', ({token}) ->
    App.loadTransfers()

  App.on 'reloadFiles', ->
    App.reloadFiles()
