


import {ReactatronPage} from './Reactatron/Page'
// import {Events} from './Events'
import {Component} from './Component'
import {Putio} from './Putio'
// import {StateMachine} from './StateMachine'

/*
 * Page
 *
 * State machine for entire site
 *
 * Changes to state trigger `transitions`
 *
 */
export class Page extends ReactatronPage {

  constructor(){
    super()
    this.Component = PageComponent;
    this.putio = new Putio;
  }

}




/* CURRENT THINKING ON ARCH

  the page class is like a giant controller
  the page component should be sent props
  we should try to use props all the way down
  well need nested controllers??
  static state is sent down and one method is exposed, emit, thats all you get
*/
var PageComponent = React.createClass({

  getInitialState: function(){
    return this.props.state
  },

  render: function(){
    console.log('rendering', this.state.name);
    return <div>hello: {this.state.name}</div>;
  }
});

// var PageComponent = React.createClass({

//   onLoad: function(event){
//     if (/#access_token=(.*)$/.test(event.target.src)){
//       putio.setToken(RegExp.$1);
//       this.forceUpdate();
//     }
//   },

//   componentDidMount: function(){
//     var webview = ReactDOM.findDOMNode(this);
//     webview.addEventListener("did-finish-load", this.onLoad);
//   },

//   render: function(){
//     if (!putio.token){
//       var src = putio.generateLoginURI();
//       return <webview className="putio-login" src={src} />
//     }

//     return <div>Logged in</div>
//   }

// });

