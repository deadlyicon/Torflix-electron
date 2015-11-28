Reactatron = require 'Reactatron'

{div, h1} = Reactatron.DOM

module.exports = Reactatron.component 'SearchResults',

  propTypes:
    query:        Reactatron.PropTypes.string.isRequired
    queryResults: Reactatron.PropTypes.any

  render: ->
    div {}, @props.query
