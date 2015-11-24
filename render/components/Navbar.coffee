Reactatron = require '../../Reactatron'

{div, h1} = Reactatron.DOM

module.exports = Reactatron.component 'Navbar',

  render: ->
    div className: 'Navbar',
