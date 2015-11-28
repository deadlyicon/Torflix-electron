Reactatron = require 'Reactatron'
Navbar = require './Navbar'
Columns = require './Columns'
Rows = require './Rows'
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
    Rows
      className: 'Dashboard layer',
      Navbar
        accountInfo: this.props.accountInfo
      div className: 'shrink grow overflow-y',
        @renderPage()

  renderPage: ->
    switch @props.page
      when 'Transfers'
        TransfersList(transfers: @props.transfers)
      when 'Files'
        FilesList(files: @props.files)
      when 'Search'
        SearchResults
          query: @props.query
          queryResults: @props.queryResults
      else
        div(null, 'unknown page', @props.page)


