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
          Result(key: index, torrent: torrent)
    else
      div {}, 'Loading…'

Result = Reactatron.component 'SearchResults-Result',
  onClick: ->
    @emit 'downloadTorrent', torrent: @props.torrent
  render: ->
    div {},
      Link onClick: @onClick, @props.torrent.title



# id
# title
# rating
# date
# size
# seeders
# leachers
