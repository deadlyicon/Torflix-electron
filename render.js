import {App} from './render/App'

window.DEBUG = {};
window.DEBUG.App = App;
window.DEBUG.$ = require('./bower_components/jquery/dist/jquery');

var app = new App;
window.DEBUG.app = app;
app.element = document.getElementsByTagName('main')[0];
app.start();
