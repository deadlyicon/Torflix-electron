Reactatron = require 'Reactatron'
Link = require './Link'

{div, span, table, thead, tbody, tr, th, td} = Reactatron.DOM
module.exports = Reactatron.component 'SearchResults',

  propTypes:
    query:        Reactatron.PropTypes.string.isRequired
    queryResults: Reactatron.PropTypes.any

  render: ->
    if !@props.queryResults?
      return div className: 'SearchResults', 'Loading…'
    table className: 'SearchResults',
      thead null,
        tr null,
          th null, 'Name'
          th null
          th null, 'Age'
          th null
      tbody null,
        @props.queryResults.map (torrent, index) ->
          Result(key: index, torrent: torrent)

Result = Reactatron.component 'SearchResults-Result',
  onClick: ->
    @emit 'downloadTorrent', torrent: @props.torrent
    @emit 'clearSearchField'
  render: ->
    torrent = @props.torrent
    tr null,
      td null,
        Link onClick: @onClick, torrent.name
      td null,
        torrent.rating
      td null,
        torrent.date
      td null,
        torrent.seeders,'/',torrent.leachers


