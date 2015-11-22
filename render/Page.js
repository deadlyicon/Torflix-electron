var jQuery = require('../bower_components/jquery/dist/jquery')
import {Component} from './Component'
import {Putio} from './Putio'
console.log('Component',Component)
console.log('Putio',Putio)

var putio = new Putio

export var Page = React.createClass({

  onLoad: function(event){
    if (/#access_token=(.*)$/.test(event.target.src)){
      putio.setToken(RegExp.$1);
      this.forceUpdate();
    }
  },

  componentDidMount: function(){
    var webview = ReactDOM.findDOMNode(this);
    webview.addEventListener("did-finish-load", this.onLoad);
  },

  render: function(){
    if (!putio.token){
      var src = putio.generateLoginURI();
      return <webview className="putio-login" src={src} />
    }

    return <div>Logged in</div>
  }

})


if (typeof window !== 'undefined'){
  window.DEBUG || (window.DEBUG = {})
  window.DEBUG.putio = putio
  window.DEBUG.jQuery = jQuery
}
