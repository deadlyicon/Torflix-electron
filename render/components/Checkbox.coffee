Reactatron = require 'Reactatron'

module.exports = Reactatron.component 'Checkbox',

  render: ->
    props = @cloneProps()
    props.className = 'Checkbox '+(props.className||'')
    props['data-checked'] = @props.checked
    Reactatron.createElement('button', props)
