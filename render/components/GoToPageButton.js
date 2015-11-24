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
    var children = this.props.children;
    if (!children || children.length === 0){
      children = this.props.page;
    }
    return <button onClick={this.onClick.bind(this)}>
      {children}
    </button>
  }
}
