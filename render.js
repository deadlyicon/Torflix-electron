// var remote = require('remote');
// var React = remote.require('react');

var App = require('./render/App');


setTimeout(function(){
  ReactDOM.render(App(), document.body.children[0]);
});
