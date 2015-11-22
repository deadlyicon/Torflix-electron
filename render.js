import {Page} from './render/Page'
var page = new Page;
page.renderOnDOMReady();
window.DEBUG = {};
window.DEBUG.page = page;
window.DEBUG.$ = require('./bower_components/jquery/dist/jquery');
