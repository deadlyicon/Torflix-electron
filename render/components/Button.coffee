Reactatron = require 'Reactatron'

module.exports = Reactatron.component 'Button',

  render: ->
    props = @cloneProps()
    props.className = 'pure-button '+(props.className||'')
    Reactatron.createElement('button', props)
