import {Events} from './Events'
import {LocationPlugin} from './LocationPlugin'

export class ReactatronPage {

  constructor(){
    this.state = this.getInitialState();
    this.events = new Events;
    // this.stats = {};
    // LocationPlugin(this);
    // this.router = new Router(this);
  }

  start(){
    var props = {
      state:  this.state,
      emit:   this.events.emit.bind(this.events),
      render: this.render.bind(this),
    };
    var instance = React.createElement(PageComponent, props);
    this.component = ReactDOM.render(instance, this.element);
    return this;
  }

  setState(update){
    console.info('page.setState', update);
    Object.assign(this.state, update);
    // TODO we may want to implement a delay here
    if (this.component){
      this.component.setState(this.state);
    }
    return this;
  }

}

class PageComponent extends React.Component {

  static get childContextTypes(){
    return {
      emit: React.PropTypes.func,
    };
  }

  getChildContext() {
    return {emit: this.props.emit};
  }

  render(){
    return this.props.render();
  }
}

