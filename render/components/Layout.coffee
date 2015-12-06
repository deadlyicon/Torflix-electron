Reactatron = require 'Reactatron'

Navbar = require './Navbar'

{div, span} = Reactatron.DOM

module.exports = Reactatron.component 'Layout',

  render: ->
    div className: 'layer rows',
      Navbar @props
      @props.children
