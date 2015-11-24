class ReactatronComponent extends React.Component {

  constructor(props){
    super(props)
    @init?()
  }

  contextTypes:
    emit: React.PropTypes.func

  emit: (args...) ->
    @context.emit(args...)


module.exports = ReactatronComponent;


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
