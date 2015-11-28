Reactatron = require 'Reactatron'
Link = require './Link'

{div, span} = Reactatron.DOM

module.exports = Reactatron.component 'SearchResults',

  propTypes:
    query:        Reactatron.PropTypes.string.isRequired
    queryResults: Reactatron.PropTypes.any

  render: ->
    if @props.queryResults?
      div {},
        @props.queryResults?.map (torrent, index) ->
          Result(key: index, torrent: torrent,)
    else
      div {}, 'Loading…'

Result = Reactatron.component 'SearchResults-Result',
  onClick: ->
    @emit 'downloadTorrent', torrent: @props.torrent
  render: ->
    torrent = @props.torrent
    div className: 'columns',
      Link onClick: @onClick, torrent.name
      div className: 'shrink grow'
      div {}, torrent.rating
      div {}, torrent.size
      div {},
        torrent.seeders
        ' / '
        torrent.leachers



# id
# title
# rating
# date
# size
# seeders
# leachers
