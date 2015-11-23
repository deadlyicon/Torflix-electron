export function authenticationActions(App){

  var setToken = function(token){
    App.putio.token = token;
    App.setState({putioToken: token});
  }

  App.on('login', (payload) => {
    setToken(payload.token);
  });

  App.on('logout', () => {
    setToken(null);
  });

}
