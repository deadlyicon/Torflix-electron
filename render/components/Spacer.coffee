Reactatron = require '../../Reactatron'

module.exports = Reactatron.component 'Spacer',

  render: ->
    props = @cloneProps()
    props.className = 'spacer '+(props.className||'')
    Reactatron.createElement('div', props)
