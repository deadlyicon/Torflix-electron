import {Component} from '../Component'
import {GoToPageButton} from './GoToPageButton'

export class Layout extends Component {

  render(){
    return <div>
      <header>
        <GoToPageButton page="Transfers" />
        <GoToPageButton page="Files" />
      </header>
      {this.props.children}
    </div>
  }
}
