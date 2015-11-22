import {Component} from '../Component'

export class LoginPage extends Component {

  init(){
    this.onLoad = this.onLoad.bind(this);
  }

  onLoad(event){
    if (/#access_token=(.*)$/.test(event.target.src)){
      // putio.setToken(RegExp.$1);
      // this.forceUpdate();
      this.emit('setPutioToken', {token:RegExp.$1});
    }
  }

  componentDidMount(){
    var webview = ReactDOM.findDOMNode(this);
    webview.addEventListener("did-finish-load", this.onLoad);
  }

  render(){
    return <webview className="putio-login" src={this.props.src} />
  }

}
