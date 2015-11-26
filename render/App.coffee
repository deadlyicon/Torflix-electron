Reactatron = require '../Reactatron'
Putio = require './Putio'
Login = require './components/Login'
Dashboard = require './components/Dashboard'

# remote = require('electron').remote;
# mainWindow.webContents.session.cookies.get({}, function(error, cookies) { debugger; });

module.exports = App = new Reactatron.App

App.state.putioToken = localStorage.putioToken
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
App.putio.token = App.state.putioToken

# we need to figure out where to trigger this
App.loadStuff = ->
  App.putio.accountInfo().then (accountInfo) ->
    App.setState accountInfo: accountInfo

  App.putio.transfers().then (transfers) ->
    App.setState transfers: transfers


App.on 'start', ->
  App.loadStuff() if App.state.putioToken


App.on 'login', (payload) ->
  token = payload.token
  localStorage.putioToken = token
  App.putio.token = token
  App.setState putioToken: token
  App.loadStuff();


App.on 'logout', ->
  App.putio.logout().then ->
    App.putio.token = null
    App.setState putioToken: null

