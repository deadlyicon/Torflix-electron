var domready = require('domready')
import {Component} from './Component'
import {Putio} from './Putio'

var putio = new Putio

export class Page {

  constructor(){

  }

  renderOnDOMReady(){
    domready(()=> this.render());
    return this;
  }

  render(){
    this.element = document.getElementsByTagName('main')[0];
    this.component = ReactDOM.render(<PageComponent />, this.element);
    return this;
  }

}


var PageComponent = React.createClass({

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

});

