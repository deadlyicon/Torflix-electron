Reactatron = require 'Reactatron'

Navbar = require './Navbar'
TransfersPage = require './TransfersPage'
FilesList = require './FilesList'
SearchResults = require './SearchResults'

module.exports = Reactatron.component 'Dashboard',

  propTypes:
    page: Reactatron.PropTypes.string.isRequired

  render: ->
    switch @props.page
      when 'Transfers'
        TransfersPage(@props)
      when 'Files'
        FilesList(@props)
      when 'Search'
        SearchResults(@props)
      else
        div(null, 'unknown page', @props.page)


