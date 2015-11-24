import {ReactatronApp} from './Reactatron/App'
import {Component} from './Component'
import {Putio} from './Putio'

// Pages
import {PageNotFoundPage} from './pages/PageNotFoundPage'
import {LoginPage} from './pages/LoginPage'
import {Dashboard} from './components/Dashboard'
// import {TransfersPage} from './pages/TransfersPage'
// import {FilesPage} from './pages/FilesPage'



export var App = new ReactatronApp

App.state.putioToken = null;
App.state.accountInfo = null;
App.state.transfers = null;
App.state.files = null;

App.render = function(){
  console.log('rendering', this.state);
  if (!this.state.putioToken){
    return <LoginPage src={this.putio.generateLoginURI()}/>;
  }else{
    return <Dashboard {...App.state} />;
  }
};

App.putio = new Putio;


App.on('login', function(payload){
  var token = payload.token;
  App.putio.token = token;
  App.setState({putioToken: token});
  App.putio.accountInfo().then(function(accountInfo){
    App.setState({accountInfo: accountInfo});
  });
  App.putio.transfers().then(function(transfers){
    App.setState({transfers: transfers});
  });
});

App.on('logout', function(){
  App.putio.token = null;
  App.setState({putioToken: null});
});
