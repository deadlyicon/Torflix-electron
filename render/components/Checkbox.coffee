Reactatron = require 'Reactatron'

module.exports = Reactatron.component 'Checkbox',

  render: ->
    props = @cloneProps()
    props.type = 'checkbox'
    props.className = 'Checkbox '+(props.className||'')
    Reactatron.createElement('input', props)
