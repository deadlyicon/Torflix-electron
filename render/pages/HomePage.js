import {Component} from '../Component'

export class HomePage extends Component {

  render(){
    return <div>
      hello booosh
      <LogoutButton />
    </div>
  }

}


class LogoutButton extends Component {
  onClick(){
    this.emit('logout');
  }
  render(){
    return <button onClick={this.onClick.bind(this)}>Logout</button>
  }
}
