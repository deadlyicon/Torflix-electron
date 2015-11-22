import {Component} from './Component'
import {Putio} from './Putio'
console.log('Component',Component)
console.log('Putio',Putio)

module.exports = Component('Page', {

  render: function(){
    return <div>hello world</div>
  }

})
