export function authenticationActions(page){

  page.events.on('setPutioToken', (payload) => {
    page.putio.token = payload.token;
    // page.putio.loadUserData(()=>{

    // });
    page.setState({putioToken: payload.token});
  });

  page.events.on('logout', () => {
    page.putio.token = null;
    page.setState({putioToken: null});
  });

}
