import {Component} from '../Component'

export class GoToPageButton extends Component {

  static get propTypes(){
    return {
      page: React.PropTypes.string.isRequired
    }
  }

  onClick(){
    this.emit('changePage', {page: this.props.page});
  }

  render(){
    return <button onClick={this.onClick.bind(this)}>
      {this.props.children}
    </button>
  }
}
