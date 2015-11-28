Torrentz = require('Torrentz')

module.exports = (App) ->

  App.state.query = null
  App.state.queryResults = null

  App.on 'search', ({query}) ->
    App.setState page: 'Search', query: query
    Torrentz.search(query).then (results) ->
      App.setState queryResults: results

  App.on 'downloadTorrent', ({torrent}) ->

    App.setState
      page: 'Downloading'
      downloadingTorrent: torrent

    Torrentz.findMagnetLink(torrent.id).then (magnetLink) ->
      App.emit 'addTransfer', {magnetLink}




