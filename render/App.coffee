Reactatron = require '../Reactatron'
Putio = require './Putio'
Login = require './components/Login'
Dashboard = require './components/Dashboard'

module.exports = App = new Reactatron.App

App.state.putioToken = null
App.state.accountInfo = null
App.state.transfers = null
App.state.files = null

App.render = ->
  console.log('rendering', App.state)
  if App.state.putioToken
    Dashboard(App.state)
  else
    Login(src: App.putio.generateLoginURI())

App.putio = new Putio


App.on 'login', (payload) ->
  token = payload.token
  App.putio.token = token
  App.setState putioToken: token

  App.putio.accountInfo().then (accountInfo) ->
    App.setState accountInfo: accountInfo

  App.putio.transfers().then (transfers) ->
    App.setState transfers: transfers


App.on 'logout', ->
  App.putio.token = null
  App.setState putioToken: null

