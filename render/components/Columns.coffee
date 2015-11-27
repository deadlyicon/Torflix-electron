Reactatron = require 'Reactatron'

module.exports = Reactatron.component 'Columns',

  render: ->
    props = @cloneProps()
    props.className = 'columns '+(props.className||'')
    Reactatron.createElement('div', props)
