Reactatron = require 'Reactatron'
Layout = require './Layout'
SearchForm = require './SearchForm'
SearchResults = require './SearchResults'

{div, input} = Reactatron.DOM


module.exports = Reactatron.component 'SearchPage',

  render: ->
    Layout @props,
      div className: '',
        SearchForm {}
      SearchResults
        query: @props.query
        queryResults: @props.queryResults
