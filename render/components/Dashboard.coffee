Reactatron = require 'Reactatron'

TransfersList = require './TransfersList'
FilesList = require './FilesList'
SearchResults = require './SearchResults'

{div, h1} = Reactatron.DOM

module.exports = Reactatron.component 'Dashboard',

  propTypes:
    page:        Reactatron.PropTypes.string.isRequired
    accountInfo: Reactatron.PropTypes.any
    transfers:   Reactatron.PropTypes.any
    files:       Reactatron.PropTypes.any

  render: ->
    div className: 'layer', @renderPage()

  renderPage: ->
    switch @props.page
      when 'Transfers'
        TransfersList(@props)
      when 'Files'
        FilesList(@props)
      when 'Search'
        SearchResults(@props)
      else
        div(null, 'unknown page', @props.page)


