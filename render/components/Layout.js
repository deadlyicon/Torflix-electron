import {Component} from '../Component'

export class Layout extends Component {

  render(){
    return <div>
      <header>layout header</header>
      {this.props.children}
    </div>
  }
}
