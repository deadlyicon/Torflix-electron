import {Component} from '../Component'

export class TransfersPage extends Component {

  // static get propTypes(){
  //   return { initialCount: React.PropTypes.number };
  // }

  render(){
    var transfers = this.props.transfers;
    if (!transfers){
      return <div>Loading transfers…</div>
    }


    // QUESTION!!!!

    // how/where do we trigger the action to load stuff?
    // I want to avoid ComponentDidMount etc.
    // Maybe I want Page object that act like controllers

    return <div>
      <h1>Transfers Page</h1>
      <div>{JSON.stringify(transfers)}</div>
    </div>
  }

}
