require 'shouldhave/Object.bindAll'

URI = require 'URIjs'
request = require './request'

CLIENT_ID = process.env.PUT_IO_CLIENT_ID
REDIRECT_URI = location.origin

class Putio

  ENDPOINT:     'https://put.io'
  API_ENDPOINT: 'https://api.put.io/v2'

  constructor: ->
    Object.bindAll(this)

  setToken: (token) ->
    @TOKEN = token

  URI: (path, query={}) ->
    query.oauth_token ||= @TOKEN # ???
    URI(@ENDPOINT)
      .query(query)
      .path(path)
      .toString()

  apiURI: (path, query={}) ->
    query.oauth_token ||= @TOKEN
    URI(@API_ENDPOINT)
      .query(query)
      .path(path)
      .toString()


  generateLoginURI: ->
    # "https://api.put.io/v2/oauth2/authenticate?client_id=#{client_id}&response_type=token&redirect_uri=#{redirect_uri}",
    @apiURI '/v2/oauth2/authenticate',
      client_id: CLIENT_ID
      response_type: 'token'
      redirect_uri: REDIRECT_URI

  ###*
  # Make an HTTP request
  #
  # @internal
  # @param {object} element
  ###
  request: (method, path, params) ->
    request(method, @apiURI(path), params)






  accountInfo: ->
    @request('get', '/v2/account/info').then(pluck('info'))


  ###

    Transfers

  ###

  transfers: ->
    @request('get', '/v2/transfers/list').then(pluck('transfers'))


  addTransfer: (magnetLink) ->
    @request('post', '/v2/transfers/add', url: magnetLink).then (response) =>
      response.transfer


  deleteTransfer: (id) ->
    @request('post', '/v2/transfers/cancel', transfer_ids: id)

    # # @putio.account.info.load()

    # if transfer? && transfer.file_id
    #   delete_file_promise = @putio.files.delete(transfer.file_id)
    #   Promise.all([delete_transfer_promise,delete_file_promise])
    # else
    #   delete_transfer_promise


  ###

  files

  ###



  file: (id) ->
    throw new Error('id required') unless id?
    @request('get', "/v2/files/#{id}").then(pluck('file')).then(@amendFile)

  directoryContents: (id) ->
    @request('get', '/v2/files/list', parent_id: id).then ({parent, files}) =>
      parent.fileIds = files.map(pluckId)
      [parent].concat(files).forEach(@amendFile)
      {parent, files}

  deleteFile: (id) ->
    throw new Error("File ID required: #{id}") unless id
    @request('post', '/v2/files/delete', file_ids: id).then (response) =>
      response

  IS_VIDEO_REGEXP = /\.(mkv|mp4|avi)$/
  amendFile: (file) ->
    file.loadedAt    = Date.now()

    if file.id == 0
      file.name = 'All Files'
      file.isDirectory = true
    else
      file.isDirectory = "application/x-directory" == file.content_type

    file.isVideo = IS_VIDEO_REGEXP.test(file.name)
    file.putioUrl = @URI "/file/#{file.id}"

    if file.isDirectory
      file.directoryContentsLoaded = !!file.fileIds

    if file.isVideo
      file.downloadUrl   = @apiURI "/v2/files/#{file.id}/download"
      file.mp4StreamUrl  = @apiURI "/v2/files/#{file.id}/mp4/stream"
      file.streamUrl     = @apiURI "/v2/files/#{file.id}/stream"
      file.playlistUrl   = @apiURI "/v2/files/#{file.id}/xspf"
      file.chromecastUrl = @URI "/file/#{file.id}/chromecast"
    file



pluck = (key) ->
  (o) -> o[key]
module.exports = Putio


# statics

pluckId = pluck('id')

