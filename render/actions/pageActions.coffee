module.exports = (App) ->

  App.state.page = 'Transfers' # || 'Files'
  # App.state.page = 'Files'

  document.addEventListener 'keyup', (event) ->
    return if event.target.nodeName == 'INPUT'

    switch event.keyCode
      # when 191 # /
      #   focusSearchInput()
      when 84 # t
        App.setState page: 'Transfers'
      when 70 # f
        App.setState page: 'Files'

  getSearchInput = ->
    App.element.querySelector('.Navbar-SearchForm input')

  App.on 'changePage', ({page}) ->
    App.setState page: page

  App.on 'clearSearchField', ->
    # App.clearSearchField()
