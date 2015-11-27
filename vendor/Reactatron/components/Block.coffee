Reactatron = require 'Reactatron'

module.exports = Reactatron.component 'Block',
  render: ->
    Reactatron.createElement('div', props, props.children)
