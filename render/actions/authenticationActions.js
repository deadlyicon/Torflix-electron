export function authenticationActions(page){

  var setToken = function(token){
    page.putio.token = token;
    page.setState({putioToken: token});
  }

  page.events.on('login', (payload) => {
    setToken(payload.token);
  });

  page.events.on('logout', () => {
    setToken(null);
  });

}
