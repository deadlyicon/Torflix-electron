import {App} from './render/App'

window.DEBUG = {};
window.DEBUG.App = App;
window.DEBUG.$ = require('./bower_components/jquery/dist/jquery');

App.element = document.getElementsByTagName('main')[0];
App.start();
