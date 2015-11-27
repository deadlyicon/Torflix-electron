Reactatron = require 'Reactatron'
Navbar = require './Navbar'
Columns = require './Columns'
Rows = require './Rows'
TransfersList = require './TransfersList'
FilesList = require './FilesList'

{div, h1} = Reactatron.DOM

module.exports = Reactatron.component 'Dashboard',

  propTypes:
    accountInfo: Reactatron.PropTypes.any
    transfers:   Reactatron.PropTypes.any
    files:       Reactatron.PropTypes.any

  getInitialState: ->
    page: 'Transfers' # || 'Files'

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
    switch @state.page
      when 'Transfers'
        TransfersList(transfers: @props.transfers)
      when 'Files'
        FilesList(files: @props.files)
      # when 'Search'
      #   Search()
      else
        div(null, 'unknown page', @state.page)





