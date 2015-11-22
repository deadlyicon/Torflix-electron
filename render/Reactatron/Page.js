export class ReactatronPage {

  constructor(){
    this.state = {};
    // this.stats = {};
    // this.events = new Events;
  }

  setState(update){
    Object.assign(this.state, update);
    // TODO we may want to implement a delay here
    this.component.setState(this.state);
    return this;
  }

  emit(){
    return this;
  }

  render(){
    var props = {
      state: this.state,
      emit: this.emit,
    };
    var instance = React.createElement(this.Component, props);
    this.component = ReactDOM.render(instance, this.element);
    return this;
  }

}
