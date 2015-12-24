require 'shouldhave/Object.values'

module.exports = (App) ->

  App.state.files = JSON.parse(localStorage.files||'{}')

  # App.loadFile = (fileId) ->
  #   App.putio.file(fileId).then(addFile)

  App.loadFiles = ->
    App.state.files or App.reloadFiles()

  App.reloadFiles = ->
    # App.putio.allFiles().then (files) ->
    # App.putio.directoryContents(0).then ({files}) ->
    App.putio.reloadAllFiles(setFiles)

  App.downloadFile = (fileId) ->
    file = App.state.files[fileId]
    if !file
      alert('cannot download file')
      return

    if file.isDirectory
      file.fileIds.forEach(App.downloadFile)
    else
      console.info('downloading', file)
      debugger


  App.on 'login', ({token}) ->
    App.loadTransfers()

  App.on 'reloadFiles', ->
    App.setState files: null
    App.reloadFiles()

  App.on 'files:download', (fileId) ->
    App.downloadFile(fileId)


  setFiles = (files) ->
    filesById = arrayToHashById(files)

    for file in files
      file.parent_directory = files[file.parent_id]

    for file in files
      file.depth = calculatDepth(file)
      if file.isDirectory
        file.fileIds = files.
          filter((f) -> f.parent_id == file.id).
          map((f) -> f.id)


    localStorage.files = JSON.stringify(filesById)
    App.setState files: filesById
    filesById


  linkFiles = (filesById) ->


  calculatDepth = (file) ->
    depth = 0
    while file.parent_directory
      depth++
      file = file.parent_directory
    depth

  download = (file) ->


  arrayToHashById = (array) ->
    byId = {}
    byId[item.id] = item for item in array
    byId
