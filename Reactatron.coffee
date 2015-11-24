React = require 'react'
ReactDOM = require 'react-dom'

module.exports = Reactatron =
  PropTypes:     React.PropTypes
  DOM:           React.DOM
  createElement: React.createElement
  findDOMNode:   ReactDOM.findDOMNode
  render:        ReactDOM.render
  App:           require('./Reactatron/App')
  component:     require('./Reactatron/component')