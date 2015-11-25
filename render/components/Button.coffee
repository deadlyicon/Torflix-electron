Reactatron = require '../../Reactatron'

module.exports = Reactatron.component 'Button',

  render: ->
    props = @cloneProps()
    props.className = 'Button '+(props.className||'')
    Reactatron.createElement('button', props)
