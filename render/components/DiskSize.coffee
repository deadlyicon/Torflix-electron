Reactatron = require 'Reactatron'
formatBytes = require '../formatBytes'

{span} = Reactatron.DOM

module.exports = Reactatron.component 'DiskSize',

  propTypes:
    size: Reactatron.PropTypes.number.isRequired

  render: ->
    span {}, formatBytes(@props.size, 2)
