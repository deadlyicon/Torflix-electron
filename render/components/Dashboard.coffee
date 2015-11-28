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

  # -- move to mixin -- #
  componentDidMount: ->
    @DOMNode().addEventListener('keyup', @onKeyup)
  componentWillUnmount: ->
    @DOMNode().removeEventListener('keyup', @onKeyup)
  # / -- move to mixin -- #

  onKeyup: (event) ->
    switch event.keyCode
      when 191
        focusSearchInput(@DOMNode())


  onPageChange: (page) ->
    @setState page: page

  render: ->
    Rows className: 'Dashboard layer',
      Navbar
        accountInfo: this.props.accountInfo
        onPageChange: @onPageChange
      div className: 'shrink grow overflow-y',
        @renderPage()

  renderPage: ->
    if @props.query
      return SearchResults
        query: @props.query
        queryResults: @props.queryResults

    switch @state.page
      when 'Transfers'
        TransfersList(transfers: @props.transfers)
      when 'Files'
        FilesList(files: @props.files)
      # when 'Search'
      #   Search()
      else
        div(null, 'unknown page', @state.page)




focusSearchInput = (DOMNode) ->
  input = DOMNode().querySelector('.Navbar-SearchForm input')
  input.focus()
  input.select()

