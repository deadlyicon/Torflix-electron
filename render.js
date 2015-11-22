import {Page} from './render/Page'
require('domready')(function(){

  window.DEBUG = {};
  window.DEBUG.Page = Page;
  window.DEBUG.$ = require('./bower_components/jquery/dist/jquery');

  var page = new Page;
  window.DEBUG.page = page;

  page.element = document.getElementsByTagName('main')[0];
  page.render();


});
