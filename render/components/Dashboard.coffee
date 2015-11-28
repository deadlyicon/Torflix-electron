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
    accountInfo: Reactatron.PropTypes.any
    transfers:   Reactatron.PropTypes.any
    files:       Reactatron.PropTypes.any

  getInitialState: ->
    page: 'Transfers' # || 'Files'

  componentDidMount: ->
    document.addEventListener('keydown', @onKeyUp)

  componentWillUnmount: ->
    document.removeEventListener('keydown', @onKeyUp)

  onKeyUp: (event) ->
    switch event.keyCode
      when 191 # /
        focusSearchInput(@DOMNode())
      when 84 # t
        @setPage 'Transfers'
      when 70 # f
        @setPage 'Files'

  setPage: (page) ->
    @setState page: page

  onSearch: (query) ->
    @setPage 'Search'
    @emit 'search', query: query

  render: ->
    Rows
      className: 'Dashboard layer',
      # onKeyUp: @onKeyUp
      Navbar
        accountInfo: this.props.accountInfo
        setPage: @setPage
        onSearch: @onSearch
      div className: 'shrink grow overflow-y',
        @renderPage()

  renderPage: ->
    switch @state.page
      when 'Transfers'
        TransfersList(transfers: @props.transfers)
      when 'Files'
        FilesList(files: @props.files)
      when 'Search'
        SearchResults
          query: @props.query
          queryResults: @props.queryResults
      else
        div(null, 'unknown page', @state.page)




focusSearchInput = (DOMNode) ->
  input = DOMNode.querySelector('.Navbar-SearchForm input')
  input.focus()
  input.select()

