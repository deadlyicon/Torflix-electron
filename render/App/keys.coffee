module.exports = (App) ->

  App.state.page = 'Transfers' # || 'Files'

  document.addEventListener 'keydown', (event) ->

    switch event.keyCode
      when 191 # /
        focusSearchInput()
      when 84 # t
        App.setState page: 'Transfers'
      when 70 # f
        App.setState page: 'Files'

  focusSearchInput = (DOMNode) ->
    input = App.element.querySelector('.Navbar-SearchForm input')
    input.focus()
    input.select()


  App.on 'changePage', ({page}) ->
    App.setState page: page
