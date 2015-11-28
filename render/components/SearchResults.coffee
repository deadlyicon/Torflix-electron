Reactatron = require 'Reactatron'

{div, span} = Reactatron.DOM

module.exports = Reactatron.component 'SearchResults',

  propTypes:
    query:        Reactatron.PropTypes.string.isRequired
    queryResults: Reactatron.PropTypes.any

  render: ->
    div {},
      div {}, @props.query
      @renderResults()

  renderResults: ->
    console.log('@props.queryResults', @props.queryResults)
    return null unless @props.queryResults?
    @props.queryResults.map (result, index) ->
      div {},
        span {}, result.title



# id
# title
# rating
# date
# size
# seeders
# leachers
