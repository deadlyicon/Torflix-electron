export class Component extends React.Component {

  static get contextTypes() {
    return {
      emit: React.PropTypes.func
    }
  }

  constructor(props){
    super(props);
    if (this.init) this.init();
  }

  emit(...args){
    return this.context.emit(...args);
  }

}


// var bindAll = (object) => {
//   console.log('object', object);
//   for (var p in object){
//     // console.log(p, typeof object[p]);
//     if (typeof object[p] === 'function'){
//       console.log('binding', p);
//       object[p] = object[p].bind(object);
//     }
//   }
// }
