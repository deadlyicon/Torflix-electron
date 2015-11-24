import {ReactatronApp} from './Reactatron/App'
import {Component} from './Component'
import {Putio} from './Putio'

// Pages
import {PageNotFoundPage} from './pages/PageNotFoundPage'
import {LoginPage} from './pages/LoginPage'
import {TransfersPage} from './pages/TransfersPage'
import {FilesPage} from './pages/FilesPage'



export var App = new ReactatronApp

App.state.page = 'Transfers';
App.state.putioToken = null;

App.pages = {
  Transfers: TransfersPage,
  Files:     FilesPage,
  NotFound:  PageNotFoundPage,
}

App.render = function(){
  console.log('rendering', this.state);
  if (!this.state.putioToken){
    return <LoginPage src={this.putio.generateLoginURI()}/>
  }else{
    return this.renderPageComponent()
  }
}

App.putio = new Putio;

App.setPutioToken = function(token){
  App.putio.token = token;
  App.setState({putioToken: token});
}

App.on('login', function(payload){
  App.setPutioToken(payload.token);
});

App.on('logout', function(){
  App.setPutioToken(null);
});


App.on('changePage', function(payload){
  console.info('changePage', page);
  var page = payload.page;
  App.setState({page: page})
});

// App.on('pageChange', function(payload){
//   var page = payload.page;
//   console.info('pageChange', page);
// });

