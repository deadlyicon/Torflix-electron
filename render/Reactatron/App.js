import {Events} from './Events'
import {LocationPlugin} from './LocationPlugin'

export class ReactatronApp {

  constructor(){
    this.state = {};
    this.events = new Events;
    this.on = this.events.on.bind(this.events)
  }

  emit(event, payload){
    console.info('emit', event, payload);
    this.events.emit(event, payload);
    return this;
  }

  start(){
    var props = {
      state:  this.state,
      emit:   this.emit.bind(this),
      render: this.render.bind(this),
    };
    var instance = React.createElement(PageComponent, props);
    this.component = ReactDOM.render(instance, this.element);
    return this;
  }

  setState(update){
    console.info('App.setState', update);
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

