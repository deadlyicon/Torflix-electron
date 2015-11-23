import {Component} from '../Component'
import {Layout} from '../components/Layout'

export class TransfersPage extends Component {

  // static get propTypes(){
  //   return { initialCount: React.PropTypes.number };
  // }

  render(){
    var transfers = this.props.transfers;
    if (!transfers){
      return <Layout>Loading transfers…</Layout>
    }


    // QUESTION!!!!

    // how/where do we trigger the action to load stuff?
    // I want to avoid ComponentDidMount etc.
    // Maybe I want Page object that act like controllers

    return <Layout>
      <h1>Transfers Page</h1>
      <div>{JSON.stringify(transfers)}</div>
    </Layout>
  }

}
