import {ReactatronApp} from './Reactatron/App'
import {Component} from './Component'
import {Putio} from './Putio'

// Actions
import {authenticationActions} from './actions/authenticationActions'
import {pageActions} from './actions/pageActions'

// Pages
import {PageNotFoundPage} from './pages/PageNotFoundPage'
import {LoginPage} from './pages/LoginPage'
import {TransfersPage} from './pages/TransfersPage'
import {FilesPage} from './pages/FilesPage'



 export class App extends ReactatronApp {

  constructor(){
    super();
    this.putio = new Putio;
    authenticationActions(this);
  }

  get pages(){
    return {
      Transfers: TransfersPage,
      Files:     FilesPage,
      NotFound:  PageNotFoundPage,
    }
  }

  getInitialState(){
    return {
      page: 'Transfers',
      putioToken: null,
    }
  }

  render(){
    console.log('rendering', this.state);
    if (!this.state.putioToken){
      return <LoginPage src={this.putio.generateLoginURI()}/>
    }else{
      return super.render()
    }
  }

}


// /*
//  * Page
//  *
//  * State machine for entire site
//  *
//  * Changes to state trigger `transitions`
//  *
//  */
// export class App extends ReactatronApp {

//   static get pages(){
//     return {
//       Transfers: TransfersPage,
//       Files:     FilesPage,
//     }
//   }

//   constructor(){
//     super();
//     this.putio = new Putio;
//     authenticationActions(this);
//   }

//   getInitialState(){
//     return {
//       page: 'Transfers',
//       putioToken: '',
//     }
//   }

//   render(){
//     console.log('rendering', this.state);

//     if (!this.state.putioToken){
//       return <LoginPage src={this.putio.generateLoginURI()}/>
//     }

//     var pageName = this.state.page;
//     var page = App.pages[pageName] || PageNotFoundPage({pageName:pageName})
//     return React.createElement(page, this.state);
//   }

// }




//  CURRENT THINKING ON ARCH

//   the page class is like a giant controller
//   the page component should be sent props
//   we should try to use props all the way down
//   well need nested controllers??
//   static state is sent down and one method is exposed, emit, thats all you get



// // var PageComponent = React.createClass({

// //   onLoad: function(event){
// //     if (/#access_token=(.*)$/.test(event.target.src)){
// //       putio.setToken(RegExp.$1);
// //       this.forceUpdate();
// //     }
// //   },

// //   componentDidMount: function(){
// //     var webview = ReactDOM.findDOMNode(this);
// //     webview.addEventListener("did-finish-load", this.onLoad);
// //   },

// //   render: function(){
// //     if (!putio.token){
// //       var src = putio.generateLoginURI();
// //       return <webview className="putio-login" src={src} />
// //     }

// //     return <div>Logged in</div>
// //   }

// // });

