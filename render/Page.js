Component = require('./Component')

module.exports = Component('Page', {

  render: function(){
    return React.DOM.div({}, 'hello world');
  }

})
