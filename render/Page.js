Component = require('./Component')

parentTest = {


  render: function(){
    return React.DOM.div({}, 'hello world');
  }
}

module.exports = Component('Page', {

  __proto__: parentTest,

})
