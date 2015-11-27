App = require './render/App'

window.DEBUG = {}
window.DEBUG.App = App

App.element = document.getElementsByTagName('main')[0]
App.start()

