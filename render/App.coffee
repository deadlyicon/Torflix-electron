Reactatron = require 'Reactatron'
Putio = require 'Putio'
Login = require './components/Login'
Dashboard = require './components/Dashboard'

# remote = require('electron').remote;
# mainWindow.webContents.session.cookies.get({}, function(error, cookies) { debugger; });

module.exports = App = new Reactatron.App

App.render = ->
  console.log('rendering', App.state)
  if App.state.putioToken
    Dashboard(App.state)
  else
    Login(src: App.loginURI())

require('./actions/authenticationActions')(App)
require('./actions/pageActions')(App)
require('./actions/transfersActions')(App)
require('./actions/filesActions')(App)
require('./actions/searchActions')(App)
