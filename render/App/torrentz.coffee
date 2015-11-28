Torrentz = require('Torrentz')

module.exports = (App) ->

  App.state.query = null
  App.state.queryResults = null

  App.on 'search', ({query}) ->
    App.setState query: query
    Torrentz.search(query).then (results) ->
      App.setState queryResults: results









