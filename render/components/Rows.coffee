Reactatron = require '../../Reactatron'

module.exports = Reactatron.component 'Rows',

  render: ->
    props = @cloneProps()
    props.className = 'rows '+(props.className||'')
    Reactatron.createElement('div', props)
