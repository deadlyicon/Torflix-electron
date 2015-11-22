import {Component} from '../Component'

export class TransfersPage extends Component {

  static get propTypes(){
    return { initialCount: React.PropTypes.number };
  }

  render(){
    return <div>
      <h1>Transfers Page</h1>
    </div>
  }

}
